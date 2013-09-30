package com.TechnoPM.Project

import org.springframework.dao.DataIntegrityViolationException

class RequirementController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [requirementInstanceList: Requirement.list(params), requirementInstanceTotal: Requirement.count()]
    }

    def create() {
        [requirementInstance: new Requirement(params)]
    }

    def save() {
        def requirementInstance = new Requirement(params)
        if (!requirementInstance.save(flush: true)) {
            render(view: "create", model: [requirementInstance: requirementInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'requirement.label', default: 'Requirement'), requirementInstance.id])
        redirect(action: "show", id: requirementInstance.id)
    }

    def show(Long id) {
        def requirementInstance = Requirement.get(id)
        if (!requirementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requirement.label', default: 'Requirement'), id])
            redirect(action: "list")
            return
        }

        [requirementInstance: requirementInstance]
    }

    def edit(Long id) {
        def requirementInstance = Requirement.get(id)
        if (!requirementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requirement.label', default: 'Requirement'), id])
            redirect(action: "list")
            return
        }

        [requirementInstance: requirementInstance]
    }

    def update(Long id, Long version) {
        def requirementInstance = Requirement.get(id)
        if (!requirementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requirement.label', default: 'Requirement'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (requirementInstance.version > version) {
                requirementInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'requirement.label', default: 'Requirement')] as Object[],
                        "Another user has updated this Requirement while you were editing")
                render(view: "edit", model: [requirementInstance: requirementInstance])
                return
            }
        }

        requirementInstance.properties = params

        if (!requirementInstance.save(flush: true)) {
            render(view: "edit", model: [requirementInstance: requirementInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'requirement.label', default: 'Requirement'), requirementInstance.id])
        redirect(action: "show", id: requirementInstance.id)
    }

    def delete(Long id) {
        def requirementInstance = Requirement.get(id)
        if (!requirementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requirement.label', default: 'Requirement'), id])
            redirect(action: "list")
            return
        }

        try {
            requirementInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'requirement.label', default: 'Requirement'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'requirement.label', default: 'Requirement'), id])
            redirect(action: "show", id: id)
        }
    }
}
