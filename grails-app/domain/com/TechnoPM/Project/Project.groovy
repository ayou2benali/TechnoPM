package com.TechnoPM.Project

class Project {
  String name
  String description
  Boolean enabled

  SortedSet<Requirement> requirements
  SortedSet<Task> tasks
  
  static hasMany = [
    tasks: Task,
    requirements: Requirement,
    members: ProjectRole
  ]
  
  static belongsTo = [status: Status]
  
  static constraints = {
    status(nullable: false)
  }
}
