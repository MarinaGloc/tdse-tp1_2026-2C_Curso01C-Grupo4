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
            "text": "@EventDriven\n@SuperSteps(no)\n\ninterface:\n    // Eventos de entrada\n    in event EV_BTN_DOWN\n    in event EV_BTN_UP\n\n    // Signals o eventos de salida hacia la capa System\n    out event EV_SYS_BTN_DOWN\n    out event EV_SYS_BTN_UP\n\n    // Variable temporizadora de debouncing (en ms)\n    var DEL_BTN_50ms : integer = 50000\n    var tick : integer = 0\n\n"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -242,
          "y": -390
        },
        "size": {
          "width": 635,
          "height": 366
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "BTN_TICKET",
            "fontSize": 11
          }
        },
        "id": "3a8da41a-33f4-474b-936a-1496335897f2",
        "z": 84,
        "embeds": [
          "7983d3c9-99bd-46d5-ab39-a6a458d6e03a"
        ]
      },
      {
        "position": {
          "x": -239,
          "y": -345
        },
        "size": {
          "width": 629,
          "height": 318
        },
        "type": "Region",
        "attrs": {
          "priority": {
            "text": 1
          }
        },
        "id": "7983d3c9-99bd-46d5-ab39-a6a458d6e03a",
        "z": 85,
        "embeds": [
          "962b04c2-365e-447e-a10f-d04fb7ae4362",
          "b426649e-ec41-40e1-bb5d-c34fd0efb2b5",
          "f25e3bcf-dc58-4f89-95e3-5666479078ec",
          "097ccf85-f9f3-4f89-b019-e583f3d02cfd",
          "a36b4400-11b1-4182-a181-a4a3bba18af7",
          "8eb386b3-4607-4360-92da-7d4fee80b8f7",
          "a8f48773-5c24-44c7-acfa-8d8f1e0b0bee",
          "9a043651-52c4-45d7-ac00-8ca9635daebc",
          "bd6df76f-ea60-40af-bf5f-6fd981570744",
          "2306c9db-4339-4162-9569-ab4cabfa476c",
          "b37edd20-04e9-482b-bb66-891cc901d080",
          "68e91384-3519-42f9-a24c-e8108045cab4"
        ],
        "parent": "3a8da41a-33f4-474b-936a-1496335897f2"
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
                "text": "EV_BTN_UP   "
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
        "z": 86,
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
        "id": "b426649e-ec41-40e1-bb5d-c34fd0efb2b5",
        "z": 87,
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
                "text": "EV_BTN_UP, always [tick == 0] / raise EV_SYS_BTN_UP"
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
        "id": "f25e3bcf-dc58-4f89-95e3-5666479078ec",
        "z": 88,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -135,
            "y": -79
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
                "text": "EV_BTN_DOWN"
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
        "z": 89,
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
                "text": "EV_BTN_UP, always [tick == 0]"
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
        "id": "a36b4400-11b1-4182-a181-a4a3bba18af7",
        "z": 90,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -62,
            "y": -289
          }
        ],
        "parent": "7983d3c9-99bd-46d5-ab39-a6a458d6e03a"
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
                "text": "EV_BTN_DOWN, always [tick == 0]"
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
        "id": "8eb386b3-4607-4360-92da-7d4fee80b8f7",
        "z": 91,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 1,
            "y": -222
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
        "z": 92,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -188,
            "y": -276
          }
        ],
        "parent": "7983d3c9-99bd-46d5-ab39-a6a458d6e03a"
      },
      {
        "position": {
          "x": -219,
          "y": -250
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
        "z": 93,
        "parent": "7983d3c9-99bd-46d5-ab39-a6a458d6e03a"
      },
      {
        "position": {
          "x": -196,
          "y": -325
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "bd6df76f-ea60-40af-bf5f-6fd981570744",
        "z": 94,
        "embeds": [
          "192f1c3a-7599-4f58-a18e-22b84ee2c4de"
        ],
        "parent": "7983d3c9-99bd-46d5-ab39-a6a458d6e03a"
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": -196,
          "y": -310
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
        "z": 95,
        "parent": "bd6df76f-ea60-40af-bf5f-6fd981570744"
      },
      {
        "position": {
          "x": -189,
          "y": -158
        },
        "size": {
          "width": 127,
          "height": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BTN_DOWN",
            "fontSize": 11
          },
          "specification": {
            "text": "entry / raise EV_SYS_BTN_DOWN"
          }
        },
        "id": "2306c9db-4339-4162-9569-ab4cabfa476c",
        "z": 96,
        "parent": "7983d3c9-99bd-46d5-ab39-a6a458d6e03a"
      },
      {
        "position": {
          "x": 211,
          "y": -252
        },
        "size": {
          "width": 161,
          "height": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BTN_FALLING",
            "fontSize": 11
          },
          "specification": {
            "text": "entry / tick = DEL_BTN_50ms\r\nalways [tick > 0] / tick--"
          }
        },
        "id": "b37edd20-04e9-482b-bb66-891cc901d080",
        "z": 97,
        "embeds": [],
        "parent": "7983d3c9-99bd-46d5-ab39-a6a458d6e03a"
      },
      {
        "position": {
          "x": 132,
          "y": -162
        },
        "size": {
          "width": 178,
          "height": 61
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BTN_RISING",
            "fontSize": 11
          },
          "specification": {
            "text": "entry / tick = DEL_BTN_50ms\r\nalways [tick > 0] / tick--"
          }
        },
        "id": "68e91384-3519-42f9-a24c-e8108045cab4",
        "z": 98,
        "embeds": [],
        "parent": "7983d3c9-99bd-46d5-ab39-a6a458d6e03a"
      },
      {
        "position": {
          "x": 25,
          "y": -471
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "bf9ab7d3-3359-4117-a2cb-d843ec3b8954",
        "z": 106,
        "embeds": [
          "6478d19d-c8c4-4cdc-9e9d-bd9b9181d176"
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
          "x": 25,
          "y": -456
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "6478d19d-c8c4-4cdc-9e9d-bd9b9181d176",
        "z": 107,
        "parent": "bf9ab7d3-3359-4117-a2cb-d843ec3b8954"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "bf9ab7d3-3359-4117-a2cb-d843ec3b8954"
        },
        "target": {
          "id": "3a8da41a-33f4-474b-936a-1496335897f2",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "49.55%",
              "dy": "2.801%",
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
        "id": "2cb19c55-d8da-44d2-8e4c-5ffcbc02f340",
        "z": 108,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
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