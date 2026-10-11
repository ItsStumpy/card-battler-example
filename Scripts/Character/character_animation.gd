class_name CharacterAnimation
extends AnimatedSprite2D


const IDLE_ANIM: String = "Idle"
const ATTACK_ANIM: String = "Attack"
const HIT_ANIM: String = "Hit"
const DEATH_ANIM: String = "Death"


func _on_animation_finished() -> void:
    if animation == IDLE_ANIM:
        return

    if animation == DEATH_ANIM:
        return

    play(IDLE_ANIM)
