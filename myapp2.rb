#myapp2.rb
require 'sinatra'

@@basepath = "https://10.64.44.12:8001/resources"

get '/' do
  'Hello world!' 
end

get '/api/api-docs' do 

content_type :json

response['Access-Control-Allow-Origin'] = '*' 

%{{	
  "apiVersion": "1.0.0",
	"swaggerVersion": "1.2",
	"authorizations":{},
	"produces": ["application/json"],
	"apis":[		
		{"path": "/nodes",
		  "description": "A Node is a physical machine that can be used in an experiment."
    },
    {"path": "/channels",
      "description": "Channels can be all the frequency channels described in wireless protocols like 802.11."
    },
    {"path": "/leases",
      "description": "Leasing a resource is equivalent to reserving a resource. A Lease is associated with a time slot (validfrom, validuntil), an account and a resource."
    },
    {"path": "/cmc",
      "description": "Chassis Manager Cards are combined of a general purpose microcontroller, an Ethernet microcontroller and a relays circuit."
    },
    {"path": "/openflow",
      "description": "OpenFlow is an emerging new technology, the most widely used Software Defined Networking (SDN) enabler."
    },
    {"path": "/lte",
      "description": "Lte Base stations."
    },
    {"path": "/wimax",
      "description": "Wimax Base Stations."
    }
	],
    "info": {
		"title": "NITlab Sample App",
		"description": "This is the reference document for the REST API provided by NITOS Broker. This REST API can be used by developers who need access to NITOS Broker inventory with other standalone or web applications, and administrators who want to script interactions with the Testbeds Servers.",
		"termsOfServiceUrl": "http://helloreverb.com/terms/",
		"contact": "",
		"license": "Apache 2.0",
		"licenseUrl": "http://www.apache.org/licenses/LICENSE-2.0.html"}

}}

end




get '/api/api-docs/nodes' do

content_type :json

response['Access-Control-Allow-Origin'] = '*'

%{{
  "apiVersion": "1.0.0",
  "swaggerVersion": "1.2",
  "basePath": "#{@@basepath}",
  "resourcePath": "/nodes",
  "produces": [
    "application/json"
  ],
  "authorizations": {},
  "apis": [
    {
      "path": "/nodes",
      "operations": [
        {
          "method": "GET",
          "summary": "Find node by uuID",
          "notes": "",
          "type": "Node",
          "nickname": "getNodeByUUID",
          "authorizations": {},
          "parameters": [
            {
              "name": "uuid",
              "description": "uuID of Node that needs to be fetched",
              "required": true,
              "type": "string",
              "paramType": "query"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid UUID supplied"
            },
            {
              "code": 404,
              "message": "Node not found"
            }
          ]
        }
      ]
    },
    {
      "path": "/nodes",
      "operations": [
        {
          "method": "GET",
          "summary": "Find node by Name",
          "notes": "",
          "type": "Node",
          "nickname": "getNodeByName",
          "authorizations": {},
          "parameters": [
            {
              "name": "name",
              "description": "Name of Node that needs to be fetched",
              "required": true,
              "type": "string",
              "paramType": "query"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid Name supplied"
            },
            {
              "code": 404,
              "message": "Node not found"
            }
          ]
        }
      ]
    },
    {
      "path": "/nodes",
      "operations": [
        {
          "method": "POST",
          "summary": "Create a resource of type Node",
          "notes": "",
          "type": "void",
          "nickname": "placeNode",
          "authorizations": {},
          "parameters": [
            {
              "name": "body",
              "description": "order placed for creating a Node",
              "required": true,
              "type": "Node",
              "paramType": "body"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid order"
            }
          ]
        },
        {
          "method": "PUT",
          "summary": "Update an existing Node",
          "notes": "",
          "type": "void",
          "nickname": "updateNode",
          "authorizations": {},
          "parameters": [
            {
              "name": "body",
              "description": "Node that needs to be updated ",
              "required": true,
              "type": "Node",
              "paramType": "body"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid uuID supplied"
            },
            {
              "code": 404,
              "message": "Node not found"
            },
            {
              "code": 405,
              "message": "Validation exception"
            }
          ]
        },
        {
          "method": "DELETE",
          "summary": "Delete Node",
          "notes": "",
          "type": "void",
          "nickname": "deleteNode",
          "authorizations": {},
          "parameters": [
            {
              "name": "body",
              "description": "Node to be deleted in jason format",
              "required": true,
              "type": "Node",
              "paramType": "body"
            
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid uuID supplied"
            },
            {
              "code": 404,
              "message": "Node not found"
            },
            {
            	"code": 405,
            	"message": "Validation exception"
            }
          ]
        }
      ]
    }
  ],
  "models": {
    "Node": {
      "id": "Node",
      "properties": {
        "uuid": {
          "type": "string",
          "required": true
        },
        "account":{
          "$ref": "Account"
        },
        "href": {
          "type": "string"
        },
        "type": {
          "type": "string"
        },
        "interfaces": {
          "$ref": "Interfaces"
        },
        "name": {
          "type": "string",
          "required": true
        },
        "urn":{
          "type": "string",
          "description": "Max length=>255",
          "maximum": 255
        },
        "status": {
          "type": "string",
          "description": "Node Status",
          "enum": [
            "unknown",
            "ready"            
          ]
        },
        "exclusive": {
          "type": "boolean"
        },
        "disk": {
          "type": "string"
        },
        "hostname": {
          "type": "string"
        },
        "cmc": {
          "$ref": "ChasisManagerCard"
        },
        "cpu": {
          "type": "Cpu"
        },
        "ram": {
          "type": "string"
        },
        "ram_type": {
          "type": "string"
        },
        "hd_capacity": {
          "type": "string"
        }
      }
    },
    "ChasisManagerCard":{
      "id": "ChasisManagerCard",
      "properties":{
        "uuid": {
          "type": "string"
        },
        "href": {
          "type": "string"
        },
        "name": {
          "type": "string"
        },
        "account": {
          "$ref": "Account"
        },
        "type": {
          "type": "string"
        },
        "mac": {
          "type": "string"
        },
        "ip": {
          "$ref": "IP"
        },
        "domain": {
          "type": "string"
        },
        "available": {
          "type": "boolean"
        },
        "status": {
          "type": "string",
          "description": "status of cmc",
          "enum": [
            "unknown",
            "ready"
          ]
        }
      }
    },
    "Account": {
      "id": "Account",
      "properties": {
        "uuid": {
          "type": "string"
        },
        "href": {
          "type": "string"
        },
        "type": {
          "type": "string"
        }
      }
    },
    "Cpu": {
      "id": "Cpu",
      "properties": {
        "cpu_type": {
          "type": "string"
        },
        "cores": {
          "type": "string"
        },
        "threads": {
          "type": "string"
        },
        "cache_11": {
          "type": "string"
        },
        "cache_12": {
          "type": "string"
        }
      }
    },
    "Interfaces": {
      "id": "Interfaces",
      "properties": {
        "uuid": {
          "type": "string"
        },
        "href": {
          "type": "string"
        },
        "type": {
          "type": "string"
        },
        "role": {
          "type": "string"
        },
        "ip": {
          "$ref": "IP"
        }   
      }
    },
    "IP": {
      "id": "IP",
      "properties": {
        "uuid": {
          "type": "string"
        },
        "href": {
          "type": "string"
        },
        "name": {
          "type": "string"
        },
        "type": {
          "type": "string"
        },
        "address": {
          "type": "string"
        },
        "netmask": {
          "type": "string"
        },
        "ip_type": {
          "type": "string",
          "description": "type of ip",
          "enum": [
            "ipv4",
            "ipv6"
          ]
        },
        "domain": {
          "type": "string"
        },
        "available": {
          "type": "boolean"
        },
        "status": {
          "type": "string",
          "enum": [
            "unknown",
            "ready"
          ]
        }
      }
    }
  }
}}


end





get '/api/api-docs/channels' do

content_type :json

response['Access-Control-Allow-Origin'] = '*'

%{{
  "apiVersion": "1.0.0",
  "swaggerVersion": "1.2",
  "basePath": "#{@@basepath}",
  "resourcePath": "/channels",
  "produces": [
    "application/json"
  ],
  "authorizations": {},
  "apis": [
    {
      "path": "/channels",
      "operations": [
        {
          "method": "GET",
          "summary": "Find channel by uuid",
          "notes": "",
          "type": "Channel",
          "nickname": "getChannelByUUID",
          "authorizations": {},
          "parameters": [
            {
              "name": "uuid",
              "description": "uuID of channel that needs to be fetched",
              "required": true,
              "type": "string",
              "paramType": "query"
            }
          ]
        }
      ]
    },
    {
      "path": "/channels",
      "operations": [
        {
          "method": "GET",
          "summary": "Find Channel by Name",
          "notes": "",
          "type": "Channel",
          "nickname": "getChannelByName",
          "authorizations": {},
          "parameters": [
            {
              "name": "name",
              "description": "Name of Channel that needs to be fetched",
              "required": true,
              "type": "string",
              "paramType": "query"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid Name supplied"
            },
            {
              "code": 404,
              "message": "Channel not found"
            }
          ]
        }
      ]
    },
    {
      "path": "/channels",
      "operations": [
        {
          "method": "POST",
          "summary": "Create a resource of type Channel",
          "notes": "",
          "type": "void",
          "nickname": "placeChannel",
          "authorizations": {},
          "parameters": [
            {
              "name": "body",
              "description": "order placed for creating a Channel",
              "required": true,
              "type": "Node",
              "paramType": "body"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid order"
            }
          ]
        },
        {
          "method": "PUT",
          "summary": "Update an existing Channel",
          "notes": "",
          "type": "void",
          "nickname": "updateChannel",
          "authorizations": {},
          "parameters": [
            {
              "name": "body",
              "description": "Channel that needs to be updated ",
              "required": true,
              "type": "Channel",
              "paramType": "body"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid uuID supplied"
            },
            {
              "code": 404,
              "message": "Channel not found"
            },
            {
              "code": 405,
              "message": "Validation exception"
            }
          ]
        },
        {
          "method": "DELETE",
          "summary": "Delete Channel",
          "notes": "",
          "type": "void",
          "nickname": "deleteChannel",
          "authorizations": {},
          "parameters": [
            {
              "name": "body",
              "description": "Channel to be deleted in jason format",
              "required": true,
              "type": "Channel",
              "paramType": "body"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid uuID supplied"
            },
            {
              "code": 404,
              "message": "Channel not found"
            }
          ]
        }
      ]
    }
  ],
  "models": {
    "Channel": {
      "id": "Channel",
      "properties": {
        "uuid": {
          "type": "string",
          "required": true
        },
        "name": {
          "type": "string",
          "required": true
        },
        "href": {
          "type": "string"
        },
        "account": {
          "$ref": "Account"
        },
        "urn":{
          "type": "string",
          "description": "Max length=>255",
          "maximum": 255
        },
        "type": {
          "type": "string"
        },
        "frequency": {
          "type": "string"
        },
        "domain": {
          "type": "string"
        },
        "available": {
          "type": "boolean"
        },
        "status": {
          "type": "string",
          "description": "Channel Status",
          "enum": [
            "1",
            "2",
            "3"
          ]
        }
      }
    },
    "Account": {
      "id": "Account",
      "properties": {
        "uuid": {
          "type": "string"
        },
        "href": {
          "type": "string"
        },
        "name": {
          "type": "string"
        },
        "type": {
          "type": "string"
        }
      }
    }
  }
}}

end






get '/api/api-docs/leases' do

content_type :json

response['Access-Control-Allow-Origin'] = '*'

%{{
  "apiVersion": "1.0.0",
  "swaggerVersion": "1.2",
  "basePath": "#{@@basepath}",
  "resourcePath": "/leases",
  "produces": [
    "application/json"
  ],
  "authorizations": {},
  "apis": [
    {
      "path": "/leases",
      "operations": [
        {
          "method": "GET",
          "summary": "Find Lease by uuID",
          "notes": "",
          "type": "Lease",
          "nickname": "getLeaseByUUID",
          "authorizations": {},
          "parameters": [
            {
              "name": "uuid",
              "description": "uuID of Lease that needs to be fetched",
              "required": true,
              "type": "string",
              "paramType": "query"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid UUID supplied"
            },
            {
              "code": 404,
              "message": "Lease not found"
            }
          ]
        }
      ]
    },
    {
      "path": "/leases",
      "operations": [
        {
          "method": "GET",
          "summary": "Find Lease by Name",
          "notes": "",
          "type": "Lease",
          "nickname": "getLeaseByName",
          "authorizations": {},
          "parameters": [
            {
              "name": "name",
              "description": "Name of Lease that needs to be fetched",
              "required": true,
              "type": "string",
              "paramType": "query"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid Name supplied"
            },
            {
              "code": 404,
              "message": "Lease not found"
            }
          ]
        }
      ]
    },
    {
      "path": "/leases",
      "operations": [
        {
          "method": "POST",
          "summary": "Create a resource of type Lease",
          "notes": "",
          "type": "void",
          "nickname": "placeLease",
          "authorizations": {},
          "parameters": [
            {
              "name": "body",
              "description": "order placed for creating a Lease",
              "required": true,
              "type": "Lease",
              "paramType": "body"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid order"
            }
          ]
        },
        {
          "method": "PUT",
          "summary": "Update an existing Lease",
          "notes": "",
          "type": "void",
          "nickname": "updateLease",
          "authorizations": {},
          "parameters": [
            {
              "name": "body",
              "description": "Lease that needs to be updated ",
              "required": true,
              "type": "Lease",
              "paramType": "body"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid uuID supplied"
            },
            {
              "code": 404,
              "message": "Lease not found"
            },
            {
              "code": 405,
              "message": "Validation exception"
            }
          ]
        },
        {
          "method": "DELETE",
          "summary": "Delete Lease",
          "notes": "",
          "type": "void",
          "nickname": "deleteLease",
          "authorizations": {},
          "parameters": [
            {
              "name": "body",
              "description": "Lease to be deleted in jason format",
              "required": true,
              "type": "Lease",
              "paramType": "body"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid uuID supplied"
            },
            {
              "code": 404,
              "message": "Lease not found"
            }
          ]
        }
      ]
    }
  ],
  "models": {
    "Lease": {
      "uuid": "Lease",
      "properties": {
        "uuid": {
          "type": "string",
          "required": true
        },
        "name": {
          "type": "string",
          "required": true
        },
        "href": {
          "type": "string"
        },
        "account": {
          "$ref": "Account"
        },
        "valid_from": {
          "type": "string",
          "format": "date-time"
        },
        "valid_until": {
          "type": "string",
          "format": "date-time"
        },
        "type":{
          "type": "string"
        },
        "components": {
          "$ref": "Components"
        },
        "status": {
          "type": "string",
          "description": "Lease Status",
          "enum": [
            "accepted",
            "past",
            "cancelled",
            "pending"
          ]
        }
      }
    },
    "Account": {
      "id": "Account",
      "properties": {
        "uuid": {
          "type": "string"
        },
        "href": {
          "type": "string"
        },
        "name": {
          "type": "string"
        },
        "type": {
          "type": "string"
        }
      }
    },
    "Components": {
      "id": "Components",
      "properties": {
        "uuid": {
          "type": "string"
        },
        "href": {
          "type": "string"
        },
        "name": {
          "type": "string"
        },
        "type": {
          "type": "string"
        },
        "domain": {
          "type": "string"
        },
        "exclusive": {
          "type": "string"
        },
        "available": {
          "type": "string"
        },
        "status": {
          "type": "string"
        }
      }
    }
  }
}}


end




get '/api/api-docs/cmc' do

content_type :json

response['Access-Control-Allow-Origin'] = '*'

%{{
  "apiVersion": "1.0.0",
  "swaggerVersion": "1.2",
  "basePath": "#{@@basepath}",
  "resourcePath": "/cmc",
  "produces": [
    "application/json"
  ],
  "authorizations": {},
  "apis": [
    {
      "path": "/cmc",
      "operations": [
        {
          "method": "GET",
          "summary": "Find CMC by uuID",
          "notes": "",
          "type": "CMC",
          "nickname": "getCmcByUUID",
          "authorizations": {},
          "parameters": [
            {
              "name": "uuid",
              "description": "uuID of CMC that needs to be fetched",
              "required": true,
              "type": "string",
              "paramType": "query"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid UUID supplied"
            },
            {
              "code": 404,
              "message": "CMC not found"
            }
          ]
        }
      ]
    },
    {
      "path": "/cmc",
      "operations": [
        {
          "method": "GET",
          "summary": "Find CMC by Name",
          "notes": "",
          "type": "CMC",
          "nickname": "getCmcByName",
          "authorizations": {},
          "parameters": [
            {
              "name": "name",
              "description": "Name of CMC that needs to be fetched",
              "required": true,
              "type": "string",
              "paramType": "query"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid UUID supplied"
            },
            {
              "code": 404,
              "message": "CMC not found"
            }
          ]
        }
      ]
    },
    {
      "path": "/cmc",
      "operations": [
        {
          "method": "POST",
          "summary": "Create a resource of type CMC",
          "notes": "",
          "type": "void",
          "nickname": "placeCmc",
          "authorizations": {},
          "parameters": [
            {
              "name": "body",
              "description": "order placed for creating a CMC",
              "required": true,
              "type": "CMC",
              "paramType": "body"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid order"
            }
          ]
        },
        {
          "method": "PUT",
          "summary": "Update an existing CMC",
          "notes": "",
          "type": "void",
          "nickname": "updateCmc",
          "authorizations": {},
          "parameters": [
            {
              "name": "body",
              "description": "CMC that needs to be updated ",
              "required": true,
              "type": "CMC",
              "paramType": "body"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid uuID supplied"
            },
            {
              "code": 404,
              "message": "CMC not found"
            },
            {
              "code": 405,
              "message": "Validation exception"
            }
          ]
        },
        {
          "method": "DELETE",
          "summary": "Delete CMC",
          "notes": "",
          "type": "void",
          "nickname": "deleteCmc",
          "authorizations": {},
          "parameters": [
            {
              "name": "body",
              "description": "CMC to be deleted in jason format",
              "required": true,
              "type": "CMC",
              "paramType": "body"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid uuID supplied"
            },
            {
              "code": 404,
              "message": "Channel not found"
            }
          ]
        }
      ]
    }
  ],
  "models": {
    "CMC": {
      "uuid": "CMC",
      "properties": {
        "uuid": {
          "type": "string",
          "required": true
        },
        "href": {
          "type": "string"
        },
        "name": {
          "type": "string",
          "required": true
        },
        "account": {
          "$ref": "Account"
        },
        "node": {
          "$ref": "Node"
        },
        "type": {
          "type": "string"
        },
        "mac": {
          "type": "string"
        },
        "domain": {
          "type": "string"
        },
        "ip": {
          "$ref": "IP"
        },
        "available": {
          "type": "boolean"
        },
        "status": {
          "type": "string",
          "description": "CMC Status",
          "enum": [
            "placed",
            "approved",
            "delivered"
          ]
        }
      }
    },
    "Node": {
      "id": "Node",
      "properties": {
        "uuid": {
          "type": "string",
          "required": true
        },
        "account":{
          "$ref": "Account"
        },
        "href": {
          "type": "string"
        },
        "type": {
          "type": "string"
        },
        "interfaces": {
          "$ref": "Interface"
        },
        "name": {
          "type": "string",
          "required": true
        },
        "urn":{
          "type": "string",
          "description": "Max length=>255",
          "maximum": 255
        },
        "status": {
          "type": "string",
          "description": "Node Status",
          "enum": [
            "unknown",
            "ready"            
          ]
        },
        "exclusive": {
          "type": "boolean"
        },
        "disk": {
          "type": "string"
        },
        "hostname": {
          "type": "string"
        },
        "cmc": {
          "$ref": "CMC"
        },
        "cpu": {
          "type": "Cpu"
        },
        "ram": {
          "type": "string"
        },
        "ram_type": {
          "type": "string"
        },
        "hd_capacity": {
          "type": "string"
        }
      }
    },
    "Account": {
      "uuid": "Account",
      "properties": {
        "uuid": {
          "type": "string"
        },
        "href": {
          "type": "string"
        },
        "type": {
          "type": "string"
        }
      }
    },
    "IP": {
      "uuid": "IP",
      "properties": {
        "uuid": {
          "type": "string"
        },
        "href": {
          "type": "string"
        },
        "name": {
          "type": "string"
        },
        "type": {
          "type": "string"
        },
        "address": {
          "type": "string"
        },
        "netmask": {
          "type": "string"
        },
        "ip_type": {
          "type": "string",
          "description": "type of ip",
          "enum": [
            "ipv4",
            "ipv6"
          ]
        },
        "interface": {
          "$ref": "Interface"
        },
        "domain": {
          "type": "string"
        },
        "available": {
          "type": "boolean"
        },
        "status": {
          "type": "string",
          "enum": [
            "unknown",
            "ready"
          ]
        }
      }
    },
    "Interface": {
      "id": "Interface",
      "properties": {     
        "role": {
          "type": "string"
        },
        "component": {
          "$ref": "Component"
        },
        "channel": {
          "$ref": "Channel"
        },
        "mac": {
          "type": "string"
        },
        "ip": {
          "$ref": "IP"
        },
        "description": {
          "type": "string"
        },
        "link": {
          "$ref": "Link"
        }
      }
    },
    "Cpu": {
      "id": "Cpu",
      "properties": {
        "cpu_type": {
          "type": "string"
        },
        "cores": {
          "type": "string"
        },
        "threads": {
          "type": "string"
        },
        "cache_11": {
          "type": "string"
        },
        "cache_12": {
          "type": "string"
        }
      }
    },
    "Link": {
      "id": "Link",
      "properties": {
        "link_type": {
          "type": "string"
        },
        "interfaces": {
          "$ref": "Interface"
        }
      }
    },
    "Component": {
      "id": "Component",
      "properties": {
        "domain": {
          "type": "string"
        },
        "exclusive": {
          "type": "string"
        },
        "available": {
          "type": "string"
        }
      }
    },
    "Channel": {
      "id": "Channel",
      "properties": {
        "uuid": {
          "type": "string",
          "required": true
        },
        "name": {
          "type": "string",
          "required": true
        },
        "href": {
          "type": "string"
        },
        "account": {
          "$ref": "Account"
        },
        "urn":{
          "type": "string",
          "description": "Max length=>255",
          "maximum": 255
        },
        "type": {
          "type": "string"
        },
        "frequency": {
          "type": "string"
        },
        "domain": {
          "type": "string"
        },
        "available": {
          "type": "boolean"
        },
        "status": {
          "type": "string",
          "description": "Channel Status",
          "enum": [
            "1",
            "2",
            "3"
          ]
        }
      }
    }
  }
}}

end




get '/api/api-docs/openflow' do

content_type :json

response['Access-Control-Allow-Origin'] = '*'

%{{
  "apiVersion": "1.0.0",
  "swaggerVersion": "1.2",
  "basePath": "#{@@basepath}",
  "resourcePath": "/openflow",
  "produces": [
    "application/json"
  ],
  "authorizations": {},
  "apis": [
    {
      "path": "/openflow",
      "operations": [
        {
          "method": "GET",
          "summary": "Find Openflow switch by uuID",
          "notes": "",
          "type": "Openflow",
          "nickname": "getOpenflowByUUID",
          "authorizations": {},
          "parameters": [
            {
              "name": "uuid",
              "description": "uuID of Openflow switch that needs to be fetched",
              "required": true,
              "type": "string",
              "paramType": "query"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid UUID supplied"
            },
            {
              "code": 404,
              "message": "Openflow not found"
            }
          ]
        }
      ]
    },
    {
      "path": "/openflow",
      "operations": [
        {
          "method": "GET",
          "summary": "Find Openflow switch by Name",
          "notes": "",
          "type": "Openflow",
          "nickname": "getOpenflowByName",
          "authorizations": {},
          "parameters": [
            {
              "name": "name",
              "description": "Name of Openflow switch that needs to be fetched",
              "required": true,
              "type": "string",
              "paramType": "query"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid Name supplied"
            },
            {
              "code": 404,
              "message": "Openflow switch not found"
            }
          ]
        }
      ]
    },
    {
      "path": "/openflow",
      "operations": [
        {
          "method": "POST",
          "summary": "Create a resource of type Openflow switch",
          "notes": "",
          "type": "void",
          "nickname": "placeOpenflow",
          "authorizations": {},
          "parameters": [
            {
              "name": "body",
              "description": "order placed for creating an Openflow switch",
              "required": true,
              "type": "Openflow",
              "paramType": "body"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid order"
            }
          ]
        },
        {
          "method": "PUT",
          "summary": "Update an existing Openflow switch",
          "notes": "",
          "type": "void",
          "nickname": "updateOpenflow",
          "authorizations": {},
          "parameters": [
            {
              "name": "body",
              "description": "Openflow switch that needs to be updated ",
              "required": true,
              "type": "Openflow",
              "paramType": "body"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid uuID supplied"
            },
            {
              "code": 404,
              "message": "Openflow not found"
            },
            {
              "code": 405,
              "message": "Validation exception"
            }
          ]
        },
        {
          "method": "DELETE",
          "summary": "Delete Openflow switch",
          "notes": "",
          "type": "void",
          "nickname": "deleteOpenflow",
          "authorizations": {},
          "parameters": [
            {
              "name": "body",
              "description": "Openflow switch to be deleted in jason format",
              "required": true,
              "type": "Openflow",
              "paramType": "body"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid uuID supplied"
            },
            {
              "code": 404,
              "message": "Openflow switch not found"
            }
          ]
        }
      ]
    }
  ],
  "models": {
    "Openflow": {
      "id": "Openflow",
      "properties": {
        "hostname": {
          "type": "string"
        },
        "switch_model": {
          "type": "string"
        },
        "switch_type": {
          "type": "string"
        },
        "openflow_version": {
          "type": "string"
        },
        "switch_OS": {
          "type": "string"
        },
        "datapath_id": {
          "type": "string"
        },
        "interfaces":{
          "$ref": "Interface"
        },
        "of_controller_ip": {
          "type": "IP"
        },
        "of_controller_port": {
          "type": "string"
        }
      }
    },
    "IP": {
      "id": "IP",
      "properties": {
        "address": {
          "type": "string"
        },
        "netmask": {
          "type": "string"
        },
        "ip_type": {
          "type": "string",
          "description": "type of ip",
          "enum": [
            "ipv4",
            "ipv6"
          ]
        },
        "interface": {
          "$ref": "Interface"
        }
      }
    },
    "Interface": {
      "id": "Interface",
      "properties": {
        "role": {
          "type": "string"
        },
        "mac": {
          "type": "string"
        },
        "ip": {
          "$ref": "IP"
        },
        "description": {
          "type": "string"
        },
        "link": {
          "$ref": "Link"
        }
      }
    },
    "Link": {
      "id": "Link",
      "properties": {
        "link_type": {
          "type": "string"
        },
        "interfaces": {
          "$ref": "Interface"
        }
      }
    }
  }
}}

end





get '/api/api-docs/lte' do

content_type :json

response['Access-Control-Allow-Origin'] = '*'

%{{
  "apiVersion": "1.0.0",
  "swaggerVersion": "1.2",
  "basePath": "#{@@basepath}",
  "resourcePath": "/lte",
  "produces": [
    "application/json"
  ],
  "authorizations": {},
  "apis": [
    {
      "path": "/lte",
      "operations": [
        {
          "method": "GET",
          "summary": "Find Lte by uuID",
          "notes": "",
          "type": "Lte",
          "nickname": "getLteByUUID",
          "authorizations": {},
          "parameters": [
            {
              "name": "uuid",
              "description": "uuID of Lte that needs to be fetched",
              "required": true,
              "type": "string",
              "paramType": "query"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid UUID supplied"
            },
            {
              "code": 404,
              "message": "Lte not found"
            }
          ]
        }
      ]
    },
    {
      "path": "/lte",
      "operations": [
        {
          "method": "GET",
          "summary": "Find Lte by Name",
          "notes": "",
          "type": "Lte",
          "nickname": "getLteByName",
          "authorizations": {},
          "parameters": [
            {
              "name": "name",
              "description": "Name of Lte that needs to be fetched",
              "required": true,
              "type": "string",
              "paramType": "query"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid Name supplied"
            },
            {
              "code": 404,
              "message": "Lte not found"
            }
          ]
        }
      ]
    },
    {
      "path": "/lte",
      "operations": [
        {
          "method": "POST",
          "summary": "Create a resource of type Lte",
          "notes": "",
          "type": "void",
          "nickname": "placeLte",
          "authorizations": {},
          "parameters": [
            {
              "name": "body",
              "description": "order placed for creating a Lte",
              "required": true,
              "type": "Lte",
              "paramType": "body"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid order"
            }
          ]
        },
        {
          "method": "PUT",
          "summary": "Update an existing Lte",
          "notes": "",
          "type": "void",
          "nickname": "updateLte",
          "authorizations": {},
          "parameters": [
            {
              "name": "body",
              "description": "Lte that needs to be updated ",
              "required": true,
              "type": "Lte",
              "paramType": "body"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid uuID supplied"
            },
            {
              "code": 404,
              "message": "Lte not found"
            },
            {
              "code": 405,
              "message": "Validation exception"
            }
          ]
        },
        {
          "method": "DELETE",
          "summary": "Delete Lte",
          "notes": "",
          "type": "void",
          "nickname": "deleteLte",
          "authorizations": {},
          "parameters": [
            {
              "name": "body",
              "description": "Lte to be deleted in jason format",
              "required": true,
              "type": "Lte",
              "paramType": "body"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid uuID supplied"
            },
            {
              "code": 404,
              "message": "Lte not found"
            }
          ]
        }
      ]
    }
  ],
  "models": {
    "Lte": {
      "id": "Lte",
      "properties": {
        "base_model": {
          "type": "string"
        },
        "vendor": {
          "type": "string"
        },
        "band": {
          "type": "string"
        },
        "mode": {
          "type": "string"
        },
        "ip_ap": {
          "$ref": "IP"
        },
        "ip_epc": {
          "$ref": "IP"
        },
        "apn": {
          "type": "string"
        },
        "ip_pdn_gw": {
          "$ref": "IP"
        }
      }
    },
    "IP": {
      "id": "IP",
      "properties": {
        "uuid": {
          "type": "string"
        },
        "href": {
          "type": "string"
        },
        "name": {
          "type": "string"
        },
        "type": {
          "type": "string"
        },
        "address": {
          "type": "string"
        },
        "netmask": {
          "type": "string"
        },
        "ip_type": {
          "type": "string",
          "description": "type of ip",
          "enum": [
            "ipv4",
            "ipv6"
          ]
        },
        "domain": {
          "type": "string"
        },
        "available": {
          "type": "boolean"
        },
        "status": {
          "type": "string",
          "enum": [
            "unknown",
            "ready"
          ]
        }
      }
    }
  }
}}


end





get '/api/api-docs/wimax' do

content_type :json

response['Access-Control-Allow-Origin'] = '*'

%{{
  "apiVersion": "1.0.0",
  "swaggerVersion": "1.2",
  "basePath": "#{@@basepath}",
  "resourcePath": "/wimax",
  "produces": [
    "application/json"
  ],
  "authorizations": {},
  "apis": [
    {
      "path": "/wimax",
      "operations": [
        {
          "method": "GET",
          "summary": "Find Wimax by uuID",
          "notes": "",
          "type": "Wimax",
          "nickname": "getWimaxByUUID",
          "authorizations": {},
          "parameters": [
            {
              "name": "uuid",
              "description": "uuID of Wimax that needs to be fetched",
              "required": true,
              "type": "string",
              "paramType": "query"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid UUID supplied"
            },
            {
              "code": 404,
              "message": "Wimax not found"
            }
          ]
        }
      ]
    },
    {
      "path": "/wimax",
      "operations": [
        {
          "method": "GET",
          "summary": "Find Wimax by Name",
          "notes": "",
          "type": "Wimax",
          "nickname": "getWimaxByName",
          "authorizations": {},
          "parameters": [
            {
              "name": "name",
              "description": "Name of Wimax that needs to be fetched",
              "required": true,
              "type": "string",
              "paramType": "query"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid Name supplied"
            },
            {
              "code": 404,
              "message": "Wimax not found"
            }
          ]
        }
      ]
    },
    {
      "path": "/wimax",
      "operations": [
        {
          "method": "POST",
          "summary": "Create a resource of type Wimax",
          "notes": "",
          "type": "void",
          "nickname": "placeWimax",
          "authorizations": {},
          "parameters": [
            {
              "name": "body",
              "description": "order placed for creating a Wimax",
              "required": true,
              "type": "Wimax",
              "paramType": "body"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid order"
            }
          ]
        },
        {
          "method": "PUT",
          "summary": "Update an existing Wimax",
          "notes": "",
          "type": "void",
          "nickname": "updateWimax",
          "authorizations": {},
          "parameters": [
            {
              "name": "body",
              "description": "Wimax that needs to be updated ",
              "required": true,
              "type": "Wimax",
              "paramType": "body"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid uuID supplied"
            },
            {
              "code": 404,
              "message": "Wimax not found"
            },
            {
              "code": 405,
              "message": "Validation exception"
            }
          ]
        },
        {
          "method": "DELETE",
          "summary": "Delete Wimax",
          "notes": "",
          "type": "void",
          "nickname": "deleteWimax",
          "authorizations": {},
          "parameters": [
            {
              "name": "body",
              "description": "Wimax to be deleted in jason format",
              "required": true,
              "type": "Wimax",
              "paramType": "body"
            }
          ],
          "responseMessages": [
            {
              "code": 400,
              "message": "Invalid uuID supplied"
            },
            {
              "code": 404,
              "message": "Wimax not found"
            }
          ]
        }
      ]
    }
  ],
  "models": {
    "Wimax": {
      "id": "Wimax",
      "properties": {
        "base_model": {
          "type": "string"
        },
        "vendor": {
          "type": "string"
        },
        "band": {
          "type": "string"
        },
        "vlan": {
          "type": "string"
        },
        "mode": {
          "type": "string"
        }
      }
    }
  }
}}


end




