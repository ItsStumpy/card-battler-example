class_name Character
extends Node


signal HealthUpdated


var current_health: int
@export var max_health: int = 20
@export var is_player: bool = false
@export var attack_delay: float = 0.3

@onready var anim: CharacterAnimation = $CharacterAnimation


func _ready():
    current_health = max_health
    HealthUpdated.emit()
    # play "Idle" animation just to be safe
    anim.play(anim.IDLE_ANIM)


func take_damage(amount: int):
    current_health -= amount
    HealthUpdated.emit()

    # play "Hit" animation
    anim.play(anim.HIT_ANIM)

    if current_health <= 0:
        die()


func attack(target: Character, damage_amount: int):
    # play "Attack" animation (sword hits on the 4th frame so we need to delay damage)
    anim.play(anim.ATTACK_ANIM)
    await get_tree().create_timer(attack_delay).timeout
    target.take_damage(damage_amount)


func heal(amount: int):
    # never goes above max health when healing or below zero
    current_health = clamp(current_health + amount, 0, max_health)
    HealthUpdated.emit()


func die():
    # play "Death" animation
    anim.play(anim.DEATH_ANIM)
