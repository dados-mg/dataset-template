import ckanapi

def upload_resource(file, resource_id, key, url):
    ckan = ckanapi.RemoteCKAN(url, apikey = key)
    resource = ckan.action.resource_show(id = resource_id)
    res = ckan.action.resource_update(id = resource_id, upload = open(file,'rb'), format=resource["format"])
    return res
