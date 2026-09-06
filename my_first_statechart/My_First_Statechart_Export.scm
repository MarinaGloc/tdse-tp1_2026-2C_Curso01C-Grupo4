{
  "graph": {
    "cells": [
      {
        "position": {
          "x": 0,
          "y": 0
        },
        "size": {
          "height": 10,
          "width": 10
        },
        "type": "Statechart",
        "id": "78749915-0da0-40a2-862f-9e8d94c7c68e",
        "attrs": {
          "name": {
            "text": "My First Statechart Export"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\n\ninterface: \n    in event myEvent\n"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": 242.5,
          "y": 150
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "1cf7ddd6-a654-4fce-a525-5cd0b51a7c95",
        "z": 2,
        "embeds": [
          "e1ea0b56-2cac-4736-8728-c52045d17674"
        ]
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": 242.5,
          "y": 165
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "e1ea0b56-2cac-4736-8728-c52045d17674",
        "z": 3,
        "parent": "1cf7ddd6-a654-4fce-a525-5cd0b51a7c95"
      },
      {
        "position": {
          "x": 220,
          "y": 220
        },
        "size": {
          "height": 60,
          "width": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "StateA",
            "fontSize": 11
          }
        },
        "id": "50ad1b06-71d9-40f5-a9eb-41d3c97fd229",
        "z": 4
      },
      {
        "position": {
          "x": 420,
          "y": 320
        },
        "size": {
          "height": 60,
          "width": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "StateB",
            "fontSize": 11
          }
        },
        "id": "0ba27e3b-c044-4a19-85eb-29757f48da2a",
        "z": 5
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "1cf7ddd6-a654-4fce-a525-5cd0b51a7c95"
        },
        "target": {
          "id": "50ad1b06-71d9-40f5-a9eb-41d3c97fd229"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {},
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "router": {
          "name": "orthogonal"
        },
        "id": "17a55dd2-5d17-42ec-b7b5-0af39e525fd0",
        "z": 6
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "50ad1b06-71d9-40f5-a9eb-41d3c97fd229"
        },
        "target": {
          "id": "0ba27e3b-c044-4a19-85eb-29757f48da2a"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "after 1 s"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "router": {
          "name": "orthogonal"
        },
        "id": "aa119f0a-ca6a-4a08-90f6-4a135495d7b8",
        "z": 7
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "0ba27e3b-c044-4a19-85eb-29757f48da2a"
        },
        "target": {
          "id": "50ad1b06-71d9-40f5-a9eb-41d3c97fd229"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "myEvent"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "router": {
          "name": "orthogonal"
        },
        "id": "33caef51-395c-4c78-a8d7-6c1d2b5e494c",
        "z": 8
      }
    ]
  },
  "genModel": {
    "generator": {
      "type": "create::c",
      "features": {
        "Outlet": {
          "targetProject": "",
          "targetFolder": "",
          "libraryTargetFolder": "",
          "skipLibraryFiles": "",
          "apiTargetFolder": ""
        },
        "LicenseHeader": {
          "licenseText": ""
        },
        "FunctionInlining": {
          "inlineReactions": false,
          "inlineEntryActions": false,
          "inlineExitActions": false,
          "inlineEnterSequences": false,
          "inlineExitSequences": false,
          "inlineChoices": false,
          "inlineEnterRegion": false,
          "inlineExitRegion": false,
          "inlineEntries": false
        },
        "OutEventAPI": {
          "observables": false,
          "getters": false
        },
        "IdentifierSettings": {
          "moduleName": "MyFirstStatechart",
          "statemachinePrefix": "myFirstStatechart",
          "separator": "_",
          "headerFilenameExtension": "h",
          "sourceFilenameExtension": "c"
        },
        "Tracing": {
          "enterState": false,
          "exitState": false,
          "generic": false
        },
        "Includes": {
          "useRelativePaths": false,
          "generateAllSpecifiedIncludes": false
        },
        "GeneratorOptions": {
          "userAllocatedQueue": false,
          "metaSource": false
        },
        "GeneralFeatures": {
          "timerService": false,
          "timerServiceTimeType": ""
        },
        "Debug": {
          "dumpSexec": false
        }
      }
    }
  }
}