package com.TechnoPM

import com.TechnoPM.Project.ProjectRole

class Person {

	transient springSecurityService

    String realName
    String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

    static belongsTo = [creator: Person]
    static hasMany = [roles: ProjectRole]
	static constraints = {
		username blank: false, unique: true
		password blank: false
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Authority> getAuthorities() {
		PersonAuthority.findAllByPerson(this).collect { it.authority } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
