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
        "id": "00ffb6d1-d225-4bc0-8b73-7df9987f57b7",
        "attrs": {
          "name": {
            "text": "sensor_statechart Export"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\n\ninterface:\n    // Eventos de entrada\n    in event EV_BTN_DOWN\n    in event EV_BTN_UP\n    in event tick\n\n    // Signals o eventos de salida hacia la capa System\n    out event EV_SYS_BTN_DOWN\n    out event EV_SYS_BTN_UP\n\n    // Variable temporizadora de debouncing (en ms)\n    var DEL_BTN : integer = 0\n\n"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -231,
          "y": -321
        },
        "size": {
          "width": 549,
          "height": 309
        },
        "type": "Region",
        "attrs": {
          "priority": {
            "text": 1
          },
          "name": {
            "text": "sensor_statechart"
          }
        },
        "id": "7983d3c9-99bd-46d5-ab39-a6a458d6e03a",
        "z": 33,
        "embeds": [
          "b426649e-ec41-40e1-bb5d-c34fd0efb2b5",
          "f25e3bcf-dc58-4f89-95e3-5666479078ec",
          "962b04c2-365e-447e-a10f-d04fb7ae4362",
          "a36b4400-11b1-4182-a181-a4a3bba18af7",
          "097ccf85-f9f3-4f89-b019-e583f3d02cfd",
          "8eb386b3-4607-4360-92da-7d4fee80b8f7",
          "a8f48773-5c24-44c7-acfa-8d8f1e0b0bee",
          "9a043651-52c4-45d7-ac00-8ca9635daebc",
          "bd6df76f-ea60-40af-bf5f-6fd981570744",
          "2306c9db-4339-4162-9569-ab4cabfa476c",
          "b37edd20-04e9-482b-bb66-891cc901d080",
          "68e91384-3519-42f9-a24c-e8108045cab4"
        ]
      },
      {
        "position": {
          "x": -211,
          "y": -226
        },
        "size": {
          "height": 60,
          "width": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BTN_UP",
            "fontSize": 11
          }
        },
        "id": "9a043651-52c4-45d7-ac00-8ca9635daebc",
        "z": 34,
        "parent": "7983d3c9-99bd-46d5-ab39-a6a458d6e03a"
      },
      {
        "position": {
          "x": -188,
          "y": -301
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "bd6df76f-ea60-40af-bf5f-6fd981570744",
        "z": 35,
        "embeds": [
          "192f1c3a-7599-4f58-a18e-22b84ee2c4de"
        ],
        "parent": "7983d3c9-99bd-46d5-ab39-a6a458d6e03a"
      },
      {
        "position": {
          "x": -181,
          "y": -134
        },
        "size": {
          "width": 75,
          "height": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BTN_DOWN",
            "fontSize": 11
          }
        },
        "id": "2306c9db-4339-4162-9569-ab4cabfa476c",
        "z": 37,
        "parent": "7983d3c9-99bd-46d5-ab39-a6a458d6e03a"
      },
      {
        "position": {
          "x": 102,
          "y": -227
        },
        "size": {
          "width": 107,
          "height": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BTN_FALLING",
            "fontSize": 11
          }
        },
        "id": "b37edd20-04e9-482b-bb66-891cc901d080",
        "z": 38,
        "embeds": [
          "0fec3127-5ea6-451b-8bf0-83965c1205fb"
        ],
        "parent": "7983d3c9-99bd-46d5-ab39-a6a458d6e03a"
      },
      {
        "position": {
          "x": 92,
          "y": -136
        },
        "size": {
          "width": 107,
          "height": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BTN_RISING",
            "fontSize": 11
          }
        },
        "id": "68e91384-3519-42f9-a24c-e8108045cab4",
        "z": 41,
        "parent": "7983d3c9-99bd-46d5-ab39-a6a458d6e03a",
        "embeds": [
          "998a075b-a7a3-4b81-9e03-f4a9d038b9f5"
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
          "x": -188,
          "y": -286
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "192f1c3a-7599-4f58-a18e-22b84ee2c4de",
        "z": 44,
        "parent": "bd6df76f-ea60-40af-bf5f-6fd981570744"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "b37edd20-04e9-482b-bb66-891cc901d080"
        },
        "target": {
          "id": "2306c9db-4339-4162-9569-ab4cabfa476c",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "56%",
              "dy": "3.333%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "tick [DEL_BTN == 0] / raise EV_SYS_BTN_DOWN"
              }
            },
            "position": {
              "distance": 0.4067181535505212,
              "offset": -13,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
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
        "id": "8eb386b3-4607-4360-92da-7d4fee80b8f7",
        "z": 45,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "7983d3c9-99bd-46d5-ab39-a6a458d6e03a"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "2306c9db-4339-4162-9569-ab4cabfa476c"
        },
        "target": {
          "id": "68e91384-3519-42f9-a24c-e8108045cab4",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "4.673%",
              "dy": "48.333%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_BTN_UP / DEL_BTN = 50    "
              }
            },
            "position": {
              "distance": 0.5252525252525253,
              "offset": -12,
              "angle": 0
            }
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
        "id": "962b04c2-365e-447e-a10f-d04fb7ae4362",
        "z": 45,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "7983d3c9-99bd-46d5-ab39-a6a458d6e03a"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "b37edd20-04e9-482b-bb66-891cc901d080"
        },
        "target": {
          "id": "9a043651-52c4-45d7-ac00-8ca9635daebc",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "93.333%",
              "dy": "36.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_BTN_UP"
              }
            },
            "position": {
              "distance": 0.4962329737083528,
              "offset": 8,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "3"
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
        "id": "a36b4400-11b1-4182-a181-a4a3bba18af7",
        "z": 45,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -118,
            "y": -224
          }
        ],
        "parent": "7983d3c9-99bd-46d5-ab39-a6a458d6e03a"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "bd6df76f-ea60-40af-bf5f-6fd981570744"
        },
        "target": {
          "id": "9a043651-52c4-45d7-ac00-8ca9635daebc",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "51.667%",
              "dy": "15%",
              "rotate": true
            }
          },
          "priority": true
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
        "id": "a8f48773-5c24-44c7-acfa-8d8f1e0b0bee",
        "z": 45,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -180,
            "y": -252
          }
        ],
        "parent": "7983d3c9-99bd-46d5-ab39-a6a458d6e03a"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "9a043651-52c4-45d7-ac00-8ca9635daebc"
        },
        "target": {
          "id": "b37edd20-04e9-482b-bb66-891cc901d080",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "6.667%",
              "dy": "46.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_BTN_DOWN / DEL_BTN = 50  "
              }
            },
            "position": {
              "distance": 0.5237154150197628,
              "offset": -8,
              "angle": 0
            }
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
        "id": "097ccf85-f9f3-4f89-b019-e583f3d02cfd",
        "z": 45,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "7983d3c9-99bd-46d5-ab39-a6a458d6e03a"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "68e91384-3519-42f9-a24c-e8108045cab4"
        },
        "target": {
          "id": "9a043651-52c4-45d7-ac00-8ca9635daebc",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "40%",
              "dy": "91.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "tick [DEL_BTN == 0] / raise EV_SYS_BTN_UP"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "2"
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
        "id": "f25e3bcf-dc58-4f89-95e3-5666479078ec",
        "z": 47,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -127,
            "y": -55
          }
        ],
        "parent": "7983d3c9-99bd-46d5-ab39-a6a458d6e03a"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "68e91384-3519-42f9-a24c-e8108045cab4"
        },
        "target": {
          "id": "2306c9db-4339-4162-9569-ab4cabfa476c",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "93.333%",
              "dy": "60%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_BTN_DOWN"
              }
            },
            "position": {
              "distance": 0.5050505050505051,
              "offset": -9,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "3"
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
        "id": "b426649e-ec41-40e1-bb5d-c34fd0efb2b5",
        "z": 48,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "7983d3c9-99bd-46d5-ab39-a6a458d6e03a"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "b37edd20-04e9-482b-bb66-891cc901d080"
        },
        "target": {
          "id": "b37edd20-04e9-482b-bb66-891cc901d080",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "98.131%",
              "dy": "41.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "tick [DEL_BTN > 0] / DEL_BTN--"
              }
            },
            "position": {
              "distance": 0.36002418393278834,
              "offset": -34.6038828572131,
              "angle": 0
            }
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
        "id": "0fec3127-5ea6-451b-8bf0-83965c1205fb",
        "z": 49,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "b37edd20-04e9-482b-bb66-891cc901d080"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "68e91384-3519-42f9-a24c-e8108045cab4"
        },
        "target": {
          "id": "68e91384-3519-42f9-a24c-e8108045cab4",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "99.065%",
              "dy": "43.333%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "tick [DEL_BTN > 0] / DEL_BTN--"
              }
            },
            "position": {
              "distance": 0.5000000452631126,
              "offset": 9,
              "angle": 0
            }
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
        "id": "998a075b-a7a3-4b81-9e03-f4a9d038b9f5",
        "z": 50,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "68e91384-3519-42f9-a24c-e8108045cab4"
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
          "moduleName": "SensorStatechart",
          "statemachinePrefix": "sensorStatechart",
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