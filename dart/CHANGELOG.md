## 0.2.0+5

- Make currentPlayerIndex nullable for simultaneous action games

## 0.2.0+4

- Update lobby info creator field for on device games

## 0.2.0+3

- Fix synchronous change problems

## 0.2.0+2

- Fix extension resolution problem
  
## 0.2.0

- Remove ktdart dependency and use unmodifiable lists and maps instead

## 0.1.5+9

- Work on socket io connection / disconnection

## 0.1.5+8

- Remove tic tac toe and move it to the game_scaffold_games package

## 0.1.5+7

- Add some logging.

## 0.1.5+6

- Add ready players to the generic game state, and fix error channel for socket-io.

## 0.1.5+5

- Fix issue with backend reader for agent games

## 0.1.5+4

- Remove some print statements

## 0.1.5+3

- Add a dedicated backend game for an agent

## 0.1.5+2

- Fix on device game client issue
  
## 0.1.5+1

- Fix some io client issues

## 0.1.5

- Adjust GameClient to always use the latest GameCode (prevent from using old Providers with bad GameCode)

## 0.1.4+1

- Update OnDeviceClient to default name to id
  
## 0.1.4

- Change GameProvider's id to be exposed as playerID

## 0.1.3+2

- Fix some server notifications
  
## 0.1.3+1

- Fix game name provider

## 0.1.3

- Remove reader from methods containing BackendGameReader

## 0.1.2

- Change single config provider to make it overridable
  
## 0.1.1

- Fix provider error
  
## 0.1.0

- First release that is more certain

## 0.0.4+2

- Add new provider extensions
- Changed the name of an extension that clashes
  
## 0.0.4+1

- Add `GameConfig` to `moveNextRound`
  
## 0.0.4

- Change some scoping of Providers

## 0.0.3+16

- Add some extensions to Reader

## 0.0.3+16

- Merge GameClient and ServerClient into GameServerClient which provides a nice interface to both functionalities
  
## 0.0.3+15

- Add lobby provider and more tests

## 0.0.3+14

- Fix type error
  
## 0.0.3+13

- Fix type error
  
## 0.0.3+10

- Fix name error
  
## 0.0.3+9

- Fix some game info logic & publish API documentation
  
## 0.0.3+8

- Add in some lobby logic

## 0.0.3+7

- Fix typing issue

## 0.0.3+6

- Update more providers to be uniquely identified and refactor to make backend providers more clearly separate

## 0.0.3+5

- Fix some errors from the last update, and also change `playerIds` to `playerIDs`.
  
## 0.0.3+4

- Make `gameValue` extension more strongly typed -- now a method

## 0.0.3+3

- Add another helper method to GenericGame to updateScores by itself, and made the scores in moveNextRound optional

## 0.0.3+2

- Fix issue with GenericEvent

## 0.0.3+1

- Fix some socket-io errors

## 0.0.3

- Some updates for min / max players

## 0.0.2+3

- Export games for testing

## 0.0.2+2

- Fix exports
  
## 0.0.2+1

- Fix export

## 0.0.2

- Documented main APIs, and organized better
- Changed `GameLocation` to not be an enum
- Added https compatibility to the socket-io server

## 0.0.1

- Initial version, first pub release
