import * as functions from "firebase-functions";
import { Reference } from '@firebase/database-types';
import axios from 'axios';
import * as admin from 'firebase-admin';

const database = admin.database();

const startGameFunctionUrl = '';
const handleEventFunctionUrl = '';

type GameCode = string;
type PlayerID = string;
type Config = object;
type PlayerName = string;

interface GameAuth {
  playerID: string;
  code: string;
};
// Start writing Firebase Functions
// https://firebase.google.com/docs/functions/typescript

// functions.logger.info("Hello logs!", { structuredData: true });
// return "Hello from Firebase!";

const gameCodesRef = database.ref().child('allGames').child('codes')

function playerGamesRef(playerID: PlayerID) {
  return database.ref().child('playerGames').child(playerID).child('games');
}

function gameRef(code: GameCode): Reference {
  return database.ref().child('game').child(code);
}

function gamePlayersRef(code: GameCode): Reference {
  return gameRef(code).child('players');
}

function gameStateRef(code: GameCode): Reference {
  return gameRef(code).child('state');
}

function gameConfigRef(code: GameCode): Reference {
  return gameRef(code).child('config');
}

function gameInfoRef(code: GameInfo): Reference {
  return gameRef(code).child('config');
}


export function generateGameCode(currentCodes: GameCode[]): GameCode {
  const LENGTH = 4;
  const characters = 'BCDFGHJKLMNPQRSTVWXYZ';
  const charactersLength = characters.length;

  let result = '';
  do {
    result = '';
    for (let i = 0; i < LENGTH; i++) {
      result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
  } while (currentCodes.includes(result));

  return result;
}


interface JoinGame extends GameAuth {
  name?: PlayerName;
}

export const joinGame = functions.https.onCall(async (data: JoinGame, context) => {
  const { code, playerID } = data;
  const playersRef = gamePlayersRef(code);
  const players = (await playersRef.get()).val();
  await playersRef.set([...players, { id: playerID }]);
  const gamesRef = playerGamesRef(data.playerID);
  const playerGames: GameCode[] = (await gamesRef.get()).val();
  await gamesRef.set([...playerGames, code]);
  // TODO: Assign player a name?
  return '';
});

export const startGame = functions.https.onCall(async (data: GameAuth, context) => {
  const initialState = await axios.post(startGameFunctionUrl, data);
  await gameStateRef(data.code).set(initialState);
  return true;
});

interface SendEvent extends GameAuth {
  event: object;
}

export const sendEvent = functions.https.onCall(async (data: SendEvent, context) => {
  const stateRef = gameStateRef(data.code);
  const currentState = (await stateRef.get()).val();
  const nextState = await axios.post(handleEventFunctionUrl, { state: currentState, ...data });
  await stateRef.set(nextState);
  return true;
});

interface CreateGame {
  playerID: PlayerID;
  config: Config;
}

export const createGame = functions.https.onCall(async (data: CreateGame, context) => {
  const takenCodes: GameCode[] = (await gameCodesRef.get()).val() ?? [];
  const newCode = generateGameCode(takenCodes);
  await gameCodesRef.set([...takenCodes, newCode]);
  await gamePlayersRef(newCode).set([{ id: data.playerID }]);
  await gameConfigRef(newCode).set(data.config);
  await playerGamesRef(data.playerID).set([newCode]);

  return newCode;
});


export const deleteGame = functions.https.onCall(async (data: GameAuth, context) => {
  const codes: GameCode[] = (await gameCodesRef.get()).val() ?? [];
  await gameCodesRef.set(codes.filter(code => code !== data.code));
  await gameRef(data.code).remove();
  const gamesRef = playerGamesRef(data.playerID);
  const playerGames: GameCode[] = (await gamesRef.get()).val();
  await gamesRef.set(playerGames.filter(code => code !== data.code));
});

export const getGames = functions.https.onCall(async (data: { playerID: PlayerID }, context) => {
  const gamesRef = playerGamesRef(data.playerID);
  const playerGames: GameCode[] = (await gamesRef.get()).val();

});