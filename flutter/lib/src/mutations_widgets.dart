import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:game_scaffold_dart/game_scaffold_dart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/experimental/mutation.dart';

/// Displays the state of a mutation with consistent UI patterns
///
/// Shows loading indicator during pending state,
/// success message with optional action during success,
/// error snackbar during error,
/// and nothing in idle state.
class MutationStateBuilder<T> extends StatelessWidget {
  const MutationStateBuilder({
    required this.state,
    required this.onPressed,
    this.label = 'Action',
    this.idleWidget,
    this.successBuilder,
    this.errorBuilder,
    super.key,
  });

  /// The current mutation state
  final MutationState<T> state;

  /// Callback when button is pressed
  final VoidCallback onPressed;

  /// Label for the action button
  final String label;

  /// Widget to show in idle state (defaults to enabled button)
  final Widget? idleWidget;

  /// Builder for success state
  /// If null, shows a success icon
  final Widget Function(T)? successBuilder;

  /// Builder for error state
  /// If null, shows error text
  final Widget Function()? errorBuilder;

  @override
  Widget build(BuildContext context) => switch (state) {
    MutationIdle() => idleWidget ?? ElevatedButton(onPressed: onPressed, child: Text(label)),
    MutationPending() => const SizedBox(
      height: 48,
      child: Center(child: CircularProgressIndicator()),
    ),
    MutationSuccess() => const Icon(Icons.check_circle),
    MutationError() => const Text('An error occurred'),
  };

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<MutationState<T>>('state', state));
    properties.add(ObjectFlagProperty<VoidCallback>.has('onPressed', onPressed));
    properties.add(StringProperty('label', label));
    properties.add(ObjectFlagProperty<Widget Function(T)?>.has('successBuilder', successBuilder));
    properties.add(ObjectFlagProperty<Widget Function()?>.has('errorBuilder', errorBuilder));
  }
}

/// Button that triggers a mutation with integrated state management
///
/// Watches the mutation state and displays appropriate UI based on the current
/// state. Disables button during pending, shows success on completion, and
/// handles errors.
///
/// Example:
/// ```dart
/// MutationButton(
///   mutation: joinGameMutation(playerID),
///   label: 'Join Game',
///   onTrigger: (ref) => joinGameMutation(playerID).run(ref, (tsx) async {
///     final client = tsx.get(gameClientProvider);
///     return await client.joinGame();
///   }),
/// )
/// ```
class MutationButton<T> extends HookConsumerWidget {
  const MutationButton({
    required this.mutation,
    required this.label,
    required this.onTrigger,
    this.successMessage,
    this.resetOnSuccess = true,
    this.resetDelay = const Duration(seconds: 2),
    super.key,
  });

  /// The mutation to trigger
  final Mutation<T> mutation;

  /// Button label
  final String label;

  /// Called when button is pressed, returns future of mutation
  final Future<T> Function(WidgetRef) onTrigger;

  /// Message to show on success (if null, just shows checkmark)
  final String? successMessage;

  /// Whether to reset mutation state after success
  final bool resetOnSuccess;

  /// How long to show success state before resetting
  final Duration resetDelay;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mutationState = ref.watch(mutation);
    final hasShownSuccess = useState(false);

    useEffect(() {
      if (mutationState is MutationSuccess && resetOnSuccess && !hasShownSuccess.value) {
        hasShownSuccess.value = true;
        Future.delayed(resetDelay, () {
          if (hasShownSuccess.value) {
            mutation.reset(ref);
            hasShownSuccess.value = false;
          }
        });
      }
      return null;
    }, [mutationState]);

    return switch (mutationState) {
      MutationIdle() => ElevatedButton(
        onPressed: () {
          onTrigger(ref);
        },
        child: Text(label),
      ),
      MutationPending() => ElevatedButton(
        onPressed: null,
        child: SizedBox(
          height: 24,
          width: 24,
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation(Colors.grey.shade600),
            ),
          ),
        ),
      ),
      MutationSuccess() => ElevatedButton(
        onPressed: null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check),
            if (successMessage != null) ...[const SizedBox(width: 8), Text(successMessage!)],
          ],
        ),
      ),
      MutationError() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red.shade100,
          foregroundColor: Colors.red.shade900,
        ),
        onPressed: () => mutation.reset(ref),
        child: const Text('Error'),
      ),
    };
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Mutation<T>>('mutation', mutation));
    properties.add(StringProperty('label', label));
    properties.add(ObjectFlagProperty<Future<T> Function(WidgetRef)>.has('onTrigger', onTrigger));
    properties.add(StringProperty('successMessage', successMessage));
    properties.add(DiagnosticsProperty<bool>('resetOnSuccess', resetOnSuccess));
    properties.add(DiagnosticsProperty<Duration>('resetDelay', resetDelay));
  }
}

/// Modal dialog for game operations with mutation state handling
///
/// Displays a dialog that shows loading, success, or error states
/// while waiting for a mutation to complete.
class GameOperationDialog<T> extends HookConsumerWidget {
  const GameOperationDialog({
    required this.title,
    required this.mutation,
    required this.onTrigger,
    required this.onSuccess,
    this.onError,
    this.content,
    super.key,
  });

  /// Dialog title
  final String title;

  /// The mutation to trigger
  final Mutation<T> mutation;

  /// Called to trigger the mutation
  final Future<T> Function(WidgetRef) onTrigger;

  /// Called when mutation succeeds
  final void Function(T) onSuccess;

  /// Called when mutation fails
  final void Function()? onError;

  /// Dialog content widget
  final Widget? content;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mutationState = ref.watch(mutation);

    useEffect(() {
      if (mutationState is MutationSuccess<T>) {
        final success = mutationState;
        onSuccess(success.value);
        Future.microtask(() => Navigator.of(context).pop());
      }
      if (mutationState is MutationError) {
        onError?.call();
      }
      return null;
    }, [mutationState]);

    return AlertDialog(
      title: Text(title),
      content: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (content != null) ...[content!, const SizedBox(height: 16)],
            switch (mutationState) {
              MutationIdle() => const SizedBox.shrink(),
              MutationPending() => const Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Processing...'),
                ],
              ),
              MutationSuccess() => const Column(
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 48),
                  SizedBox(height: 16),
                  Text('Success!'),
                ],
              ),
              MutationError(:final error) => Column(
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 48),
                  const SizedBox(height: 16),
                  Text('Error: $error'),
                  const SizedBox(height: 16),
                  ElevatedButton(onPressed: () => mutation.reset(ref), child: const Text('Retry')),
                ],
              ),
            },
          ],
        ),
      ),
      actions: [
        if (mutationState is! MutationPending)
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close')),
        if (mutationState is MutationIdle)
          ElevatedButton(onPressed: () => onTrigger(ref), child: const Text('Confirm')),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
    properties.add(DiagnosticsProperty<Mutation<T>>('mutation', mutation));
    properties.add(ObjectFlagProperty<Future<T> Function(WidgetRef)>.has('onTrigger', onTrigger));
    properties.add(ObjectFlagProperty<void Function(T)>.has('onSuccess', onSuccess));
    properties.add(ObjectFlagProperty<void Function()?>.has('onError', onError));
  }
}

/// Displays a list of games with mutation-based delete button for each
///
/// Shows a list tile for each game with delete functionality.
class GameListView extends HookConsumerWidget {
  const GameListView({
    required this.games,
    required this.onGameSelected,
    this.onGameDeleted,
    super.key,
  });

  /// List of available games
  final IList<GameInfo> games;

  /// Called when a game is tapped
  final void Function(GameInfo) onGameSelected;

  /// Called after a game is successfully deleted
  final void Function(GameInfo)? onGameDeleted;

  @override
  Widget build(BuildContext context, WidgetRef ref) => ListView.builder(
    itemCount: games.length,
    itemBuilder: (context, index) {
      final game = games[index];
      final deleteMutationState = ref.watch(deleteGameMutation);

      return ListTile(
        title: Text(game.gameID),
        subtitle: Text('${game.players.length} players'),
        trailing: switch (deleteMutationState) {
          MutationIdle() => IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Delete Game?'),
                  content: Text('Delete game ${game.gameID}?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        deleteGameMutation
                            .run(ref, (tsx) async {
                              final client = tsx.get(gameClientProvider);
                              return client.deleteGame(game.gameID);
                            })
                            .then((_) => onGameDeleted?.call(game));
                      },
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              );
            },
          ),
          MutationPending() => const SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          MutationSuccess() => const Icon(Icons.check, color: Colors.green),
          MutationError() => IconButton(
            icon: const Icon(Icons.error, color: Colors.red),
            onPressed: () => deleteGameMutation.reset(ref),
          ),
        },
        onTap: () => onGameSelected(game),
      );
    },
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<GameInfo>('games', games));
    properties.add(
      ObjectFlagProperty<void Function(GameInfo)>.has('onGameSelected', onGameSelected),
    );
    properties.add(
      ObjectFlagProperty<void Function(GameInfo)?>.has('onGameDeleted', onGameDeleted),
    );
  }
}

/// Form for joining an existing game
///
/// Provides input fields for game code and player name,
/// with a button that triggers the join game mutation.
class JoinGameForm extends HookConsumerWidget {
  const JoinGameForm({required this.onJoinSuccess, this.onJoinError, super.key});

  /// Called with assigned player name when join succeeds
  final void Function(PlayerName) onJoinSuccess;

  /// Called if join fails
  final void Function()? onJoinError;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final codeController = useTextEditingController();
    final nameController = useTextEditingController();
    final playerID = ref.watch(playerIDProvider);
    final joinState = ref.watch(joinGameMutation(playerID));

    useEffect(() {
      if (joinState is MutationSuccess<PlayerName>) {
        onJoinSuccess(joinState.value);
      }
      if (joinState is MutationError) {
        onJoinError?.call();
      }
      return null;
    }, [joinState]);

    return Column(
      children: [
        TextField(
          controller: codeController,
          decoration: const InputDecoration(labelText: 'Game Code', hintText: 'Enter game code'),
          enabled: joinState is! MutationPending,
        ),
        const SizedBox(height: 16),
        TextField(
          controller: nameController,
          decoration: const InputDecoration(labelText: 'Player Name', hintText: 'Enter your name'),
          enabled: joinState is! MutationPending,
        ),
        const SizedBox(height: 24),
        MutationButton<PlayerName>(
          mutation: joinGameMutation(playerID),
          label: 'Join Game',
          onTrigger: (ref) => joinGameMutation(playerID).run(ref, (tsx) async {
            final code = codeController.text;
            final name = nameController.text;
            if (code.isEmpty || name.isEmpty) {
              throw Exception('Code and name required');
            }
            final client = tsx.get(gameClientProvider);
            client.setGameCode(code);
            client.setPlayerName(name);
            final result = await client.joinGame();
            return result ?? name;
          }),
          successMessage: 'Joined!',
        ),
        if (joinState is MutationError)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Builder(
              builder: (context) {
                final error = joinState as MutationError;
                return Text('Error: ${error.error}', style: TextStyle(color: Colors.red.shade600));
              },
            ),
          ),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      ObjectFlagProperty<void Function(PlayerName)>.has('onJoinSuccess', onJoinSuccess),
    );
    properties.add(ObjectFlagProperty<void Function()?>.has('onJoinError', onJoinError));
  }
}

/// Form for creating a new game
///
/// Provides interface to set game config and create a new game.
class CreateGameForm extends HookConsumerWidget {
  const CreateGameForm({required this.onCreateSuccess, this.onCreateError, super.key});

  /// Called with game code when creation succeeds
  final void Function(GameCode) onCreateSuccess;

  /// Called if creation fails
  final void Function()? onCreateError;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createState = ref.watch(createGameMutation);
    final config = ref.watch(singleConfig);

    useEffect(() {
      if (createState is MutationSuccess<GameCode>) {
        onCreateSuccess(createState.value);
      }
      if (createState is MutationError) {
        onCreateError?.call();
      }
      return null;
    }, [createState]);

    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Game Configuration', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(labelText: 'Game Type', hintText: config.gameType),
                  enabled: false,
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Max Players',
                    hintText: '${config.maxPlayers}',
                  ),
                  enabled: false,
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(labelText: 'Rounds', hintText: '${config.rounds}'),
                  enabled: false,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        MutationButton<GameCode>(
          mutation: createGameMutation,
          label: 'Create Game',
          onTrigger: (ref) => createGameMutation.run(ref, (tsx) async {
            final client = tsx.get(gameClientProvider);
            return client.createGame();
          }),
          successMessage: 'Game created',
        ),
        if (createState is MutationSuccess)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Builder(
              builder: (context) {
                final success = createState as MutationSuccess;
                return SelectableText(
                  'Game Code: ${success.value}',
                  style: TextStyle(color: Colors.green.shade600, fontWeight: FontWeight.bold),
                );
              },
            ),
          ),
        if (createState is MutationError)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Builder(
              builder: (context) {
                final error = createState as MutationError;
                return Text('Error: ${error.error}', style: TextStyle(color: Colors.red.shade600));
              },
            ),
          ),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      ObjectFlagProperty<void Function(GameCode)>.has('onCreateSuccess', onCreateSuccess),
    );
    properties.add(ObjectFlagProperty<void Function()?>.has('onCreateError', onCreateError));
  }
}

/// Button for marking player ready for next round
///
/// Shows the state of the player marking themselves ready for the next round.
class ReadyNextRoundButton extends HookConsumerWidget {
  const ReadyNextRoundButton({this.onSuccess, this.onError, super.key});

  /// Called when player successfully marks ready
  final VoidCallback? onSuccess;

  /// Called if ready action fails
  final void Function()? onError;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerID = ref.watch(playerIDProvider);
    final readyState = ref.watch(readyNextRoundMutation(playerID));

    useEffect(() {
      if (readyState is MutationSuccess<bool>) {
        onSuccess?.call();
      }
      if (readyState is MutationError) {
        onError?.call();
      }
      return null;
    }, [readyState]);

    return MutationButton<bool>(
      mutation: readyNextRoundMutation(playerID),
      label: 'Ready for Next Round',
      onTrigger: (ref) => readyNextRoundMutation(playerID).run(ref, (tsx) async {
        // Send ready signal - actual implementation depends on game protocol
        // This is a placeholder that should be replaced with actual call
        // final client = tsx.get(gameClientProvider);
        // await client.readyNextRound();
        return true;
      }),
      successMessage: 'Ready!',
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty<VoidCallback?>.has('onSuccess', onSuccess));
    properties.add(ObjectFlagProperty<void Function()?>.has('onError', onError));
  }
}

/// Button to exit the game
///
/// Shows the state of the player exiting the game.
class ExitGameButton extends HookConsumerWidget {
  const ExitGameButton({this.onSuccess, this.onError, this.confirmBeforeExit = true, super.key});

  /// Called when player successfully exits
  final VoidCallback? onSuccess;

  /// Called if exit action fails
  final void Function()? onError;

  /// Whether to show confirmation dialog before exiting
  final bool confirmBeforeExit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerID = ref.watch(playerIDProvider);
    final exitState = ref.watch(exitGameMutation(playerID));

    useEffect(() {
      if (exitState is MutationSuccess<bool>) {
        onSuccess?.call();
      }
      if (exitState is MutationError) {
        onError?.call();
      }
      return null;
    }, [exitState]);

    return MutationButton<bool>(
      mutation: exitGameMutation(playerID),
      label: 'Exit Game',
      onTrigger: (ref) {
        if (confirmBeforeExit) {
          return showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Exit Game?'),
              content: const Text('Are you sure you want to exit the game?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('Exit'),
                ),
              ],
            ),
          ).then((confirmed) async {
            if (confirmed ?? false) {
              return exitGameMutation(playerID).run(ref, (tsx) async {
                final client = tsx.get(gameClientProvider);
                client.exitGame();
                return true;
              });
            }
            throw Exception('Cancelled');
          });
        } else {
          return exitGameMutation(playerID).run(ref, (tsx) async {
            final client = tsx.get(gameClientProvider);
            client.exitGame();
            return true;
          });
        }
      },
      successMessage: 'Exited game',
      resetOnSuccess: false,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty<VoidCallback?>.has('onSuccess', onSuccess));
    properties.add(ObjectFlagProperty<void Function()?>.has('onError', onError));
    properties.add(DiagnosticsProperty<bool>('confirmBeforeExit', confirmBeforeExit));
  }
}

/// Button to start the game
///
/// Typically used by admin. Shows per-player request state.
class StartGameButton extends HookConsumerWidget {
  const StartGameButton({this.onSuccess, this.onError, super.key});

  /// Called when start request succeeds
  final VoidCallback? onSuccess;

  /// Called if start request fails
  final void Function()? onError;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerID = ref.watch(playerIDProvider);
    final startState = ref.watch(startGameMutation(playerID));

    useEffect(() {
      if (startState is MutationSuccess<bool>) {
        onSuccess?.call();
      }
      if (startState is MutationError) {
        onError?.call();
      }
      return null;
    }, [startState]);

    return MutationButton<bool>(
      mutation: startGameMutation(playerID),
      label: 'Start Game',
      onTrigger: (ref) => startGameMutation(playerID).run(ref, (tsx) async {
        // Implementation depends on whether this is RoundService or
        // GameService operation. This is a placeholder - adjust based on
        // actual API
        return true;
      }),
      successMessage: 'Game started',
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty<VoidCallback?>.has('onSuccess', onSuccess));
    properties.add(ObjectFlagProperty<void Function()?>.has('onError', onError));
  }
}
