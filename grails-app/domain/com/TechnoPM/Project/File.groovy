package com.TechnoPM.Project

import com.TechnoPM.Person

class File {
  String filename
  String description
  Boolean enalbed
  
  static belongsTo = [author: Person]
  
  static constraints = {
  }
}
