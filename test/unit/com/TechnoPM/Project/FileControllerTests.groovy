package com.TechnoPM.Project



import org.junit.*
import grails.test.mixin.*

@TestFor(FileController)
@Mock(File)
class FileControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/file/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.fileInstanceList.size() == 0
        assert model.fileInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.fileInstance != null
    }

    void testSave() {
        controller.save()

        assert model.fileInstance != null
        assert view == '/file/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/file/show/1'
        assert controller.flash.message != null
        assert File.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/file/list'

        populateValidParams(params)
        def file = new File(params)

        assert file.save() != null

        params.id = file.id

        def model = controller.show()

        assert model.fileInstance == file
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/file/list'

        populateValidParams(params)
        def file = new File(params)

        assert file.save() != null

        params.id = file.id

        def model = controller.edit()

        assert model.fileInstance == file
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/file/list'

        response.reset()

        populateValidParams(params)
        def file = new File(params)

        assert file.save() != null

        // test invalid parameters in update
        params.id = file.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/file/edit"
        assert model.fileInstance != null

        file.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/file/show/$file.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        file.clearErrors()

        populateValidParams(params)
        params.id = file.id
        params.version = -1
        controller.update()

        assert view == "/file/edit"
        assert model.fileInstance != null
        assert model.fileInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/file/list'

        response.reset()

        populateValidParams(params)
        def file = new File(params)

        assert file.save() != null
        assert File.count() == 1

        params.id = file.id

        controller.delete()

        assert File.count() == 0
        assert File.get(file.id) == null
        assert response.redirectedUrl == '/file/list'
    }
}
