package com.TechnoPM.Project



import org.junit.*
import grails.test.mixin.*

@TestFor(SubtaskController)
@Mock(Subtask)
class SubtaskControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/subtask/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.subtaskInstanceList.size() == 0
        assert model.subtaskInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.subtaskInstance != null
    }

    void testSave() {
        controller.save()

        assert model.subtaskInstance != null
        assert view == '/subtask/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/subtask/show/1'
        assert controller.flash.message != null
        assert Subtask.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/subtask/list'

        populateValidParams(params)
        def subtask = new Subtask(params)

        assert subtask.save() != null

        params.id = subtask.id

        def model = controller.show()

        assert model.subtaskInstance == subtask
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/subtask/list'

        populateValidParams(params)
        def subtask = new Subtask(params)

        assert subtask.save() != null

        params.id = subtask.id

        def model = controller.edit()

        assert model.subtaskInstance == subtask
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/subtask/list'

        response.reset()

        populateValidParams(params)
        def subtask = new Subtask(params)

        assert subtask.save() != null

        // test invalid parameters in update
        params.id = subtask.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/subtask/edit"
        assert model.subtaskInstance != null

        subtask.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/subtask/show/$subtask.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        subtask.clearErrors()

        populateValidParams(params)
        params.id = subtask.id
        params.version = -1
        controller.update()

        assert view == "/subtask/edit"
        assert model.subtaskInstance != null
        assert model.subtaskInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/subtask/list'

        response.reset()

        populateValidParams(params)
        def subtask = new Subtask(params)

        assert subtask.save() != null
        assert Subtask.count() == 1

        params.id = subtask.id

        controller.delete()

        assert Subtask.count() == 0
        assert Subtask.get(subtask.id) == null
        assert response.redirectedUrl == '/subtask/list'
    }
}
