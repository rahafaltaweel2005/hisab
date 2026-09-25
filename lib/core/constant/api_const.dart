class ApiConst {
  static const String baseUrl = 'http://192.168.1.124:5143';

  static const String register = "/api/auth/register";
  static const String login = "/api/auth/login";
  static const String logout = "/api/auth/logout";

  static const String profile = "/api/profile";

  static const String addProject = "/api/projects";
  static const String getProjects = "/api/projects";
  static  String getProjectById(int projectId) =>  "/api/projects/$projectId";
  static  String deleteProject(int projectId) =>  "/api/projects/$projectId";
  static  String updateProject(int projectId) => "/api/projects/$projectId";
}
