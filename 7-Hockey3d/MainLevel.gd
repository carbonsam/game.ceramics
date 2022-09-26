extends Node

var scorePlayer = 0
var scoreEnemy = 0
var currentServeDirection = ServeDirection.TOWARDS_PLAYER
var puckStartPosition = null
var paddlePlayerStartPosition = null
var paddleEnemyStartPosition = null

enum ServeDirection { TOWARDS_PLAYER, TOWARDS_ENEMY }

func _ready():
	randomize()
	puckStartPosition = $Puck.global_transform
	paddleEnemyStartPosition = $EnemyPaddle.global_transform
	paddlePlayerStartPosition = $PlayerPaddle.global_transform
	$EnemyPaddle.init($Puck)
	resetGame()

func resetGame():
	scorePlayer = 0
	scoreEnemy = 0
	resetRound()

func resetRound():
	$Puck.global_transform = puckStartPosition
	$EnemyPaddle.global_transform = paddleEnemyStartPosition
	$PlayerPaddle.global_transform = paddlePlayerStartPosition

	var z
	if currentServeDirection == ServeDirection.TOWARDS_PLAYER:
		z = 1.0
	else:
		z = -1.0
		
	var v = Vector3(randf(), 0, z)
	$Puck.launch(v)

func _on_PlayerGoal_goal_scored():
	scoreEnemy += 1
	$HUD/ScoreEnemyLabel.text = str(scoreEnemy)
	currentServeDirection = ServeDirection.TOWARDS_PLAYER
	resetRound()

func _on_EnemyGoal_goal_scored():
	scorePlayer += 1
	$HUD/ScorePlayerLabel.text = str(scorePlayer)
	currentServeDirection = ServeDirection.TOWARDS_ENEMY
	resetRound()
