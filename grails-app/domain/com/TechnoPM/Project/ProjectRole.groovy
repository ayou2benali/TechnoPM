package com.TechnoPM.Project

import com.TechnoPM.Person

class ProjectRole {
  Date creationDate
  
  static belongsTo = [role: Role, project: Project, person: Person, granter: Person]
  static constraints = {
  }
}
