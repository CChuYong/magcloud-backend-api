package hackathon.redbeanbackend.dto.response

data class UserDTO(
    val id: Long,
    val email: String,
    val age: Int,
    val name: String
)