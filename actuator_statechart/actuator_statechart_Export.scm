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
            "text": "actuator_statechart Export"
          },
          "specification": {
            "text": "@EventDriven\r\n@SuperSteps(no)\r\n\r\ninterface:\r\n    // Eventos de entrada (Comandos y Reloj de 1 ms)\r\n    in event ACT_CMD_BARRIER_OPEN_FAST\r\n    in event ACT_CMD_BARRIER_KEEP_OPEN\r\n    in event ACT_CMD_BARRIER_KEEP_CLOSE\r\n    in event ACT_CMD_BARRIER_LOWERED\r\n    in event ACT_CMD_RESET_ALL\r\n    in event tick\r\n\r\n    // Variable de control de tiempo y salida digital\r\n    var OUT_LED_BARRIER : boolean = false\r\n    var tick_val : integer = 0\r\n\r\n    // Constantes de temporización\r\n    const DEL_BLINK_BARRIER_10s : integer = 10000\r\n    const DEL_BLINK_BARRIER_1s : integer = 1000"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -285,
          "y": -390
        },
        "size": {
          "width": 1176,
          "height": 526
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "OUT_LED_BARRIER",
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
          "x": -282,
          "y": -345
        },
        "size": {
          "width": 1170,
          "height": 478
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
          "44f64910-ade9-4ad1-b00c-4594d0e3e3d0",
          "9ccdcd72-ac31-4df0-8225-5b7f67fa0521",
          "9b46fe47-165b-4b13-ba45-7903279e278b",
          "5029beaa-c91f-4f10-aab7-08baafea9587",
          "a0c5622a-71eb-44cd-972e-e0480b993170",
          "92f9d89e-b4b8-424b-bba7-62717208eee7",
          "364009ba-6c9a-489e-9aed-9771dc35a6ff",
          "072ecc7b-95a5-4800-a8e1-5a4edcfe9251",
          "602ead02-a1ff-477b-8af8-e88149ab2f64",
          "e04d33a3-54b7-4c80-94de-29c199f50ea3",
          "009d9499-5d17-451c-bd72-f34873cc2c58",
          "a9e59a48-9f41-4e16-96d7-6750abedc710",
          "e7ce8ee8-58a5-4b69-8f70-0bdc03deef00",
          "5c04fe7a-83ab-4741-9163-5834122fd9c7"
        ],
        "parent": "3a8da41a-33f4-474b-936a-1496335897f2"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "e7ce8ee8-58a5-4b69-8f70-0bdc03deef00"
        },
        "target": {
          "id": "5c04fe7a-83ab-4741-9163-5834122fd9c7",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "74.211%",
              "dy": "25%",
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
                "text": "ACT_CMD_BARRIER_KEEP_OPEN / OUT_LED_BARRIER = true"
              }
            },
            "position": {
              "distance": 0.7008032128514057,
              "offset": 9,
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
        "id": "44f64910-ade9-4ad1-b00c-4594d0e3e3d0",
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
          "id": "e7ce8ee8-58a5-4b69-8f70-0bdc03deef00"
        },
        "target": {
          "id": "009d9499-5d17-451c-bd72-f34873cc2c58",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "17.021%",
              "dy": "63.333%",
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
                "text": "ACT_CMD_BARRIER_LOWERED / OUT_LED_BARRIER = false"
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
        "id": "9ccdcd72-ac31-4df0-8225-5b7f67fa0521",
        "z": 87,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 206,
            "y": 65
          }
        ],
        "parent": "7983d3c9-99bd-46d5-ab39-a6a458d6e03a"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "a9e59a48-9f41-4e16-96d7-6750abedc710"
        },
        "target": {
          "id": "009d9499-5d17-451c-bd72-f34873cc2c58",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "63.83%",
              "dy": "25%",
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
                "text": "ACT_CMD_RESET_ALL / OUT_LED_BARRIER = false"
              }
            },
            "position": {
              "distance": 0.5013746436678789,
              "offset": 12,
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
        "id": "9b46fe47-165b-4b13-ba45-7903279e278b",
        "z": 88,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 419,
            "y": -289
          }
        ],
        "parent": "7983d3c9-99bd-46d5-ab39-a6a458d6e03a"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "a9e59a48-9f41-4e16-96d7-6750abedc710"
        },
        "target": {
          "id": "5c04fe7a-83ab-4741-9163-5834122fd9c7",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "91.053%",
              "dy": "55%",
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
                "text": "ACT_CMD_BARRIER_OPEN_FAST / OUT_LED_BARRIER = true"
              }
            },
            "position": {
              "distance": 0.6868732076745003,
              "offset": -13.5,
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
        "id": "5029beaa-c91f-4f10-aab7-08baafea9587",
        "z": 89,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 221,
            "y": -180
          },
          {
            "x": 221,
            "y": -112
          }
        ],
        "parent": "7983d3c9-99bd-46d5-ab39-a6a458d6e03a"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "5c04fe7a-83ab-4741-9163-5834122fd9c7"
        },
        "target": {
          "id": "009d9499-5d17-451c-bd72-f34873cc2c58",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "58.511%",
              "dy": "71.667%",
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
                "text": "ACT_CMD_BARRIER_KEEP_CLOSE / OUT_LED_BARRIER = false"
              }
            },
            "position": {
              "distance": 0.39285714285714285,
              "offset": 151,
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
        "id": "a0c5622a-71eb-44cd-972e-e0480b993170",
        "z": 90,
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
          "id": "e7ce8ee8-58a5-4b69-8f70-0bdc03deef00"
        },
        "target": {
          "id": "a9e59a48-9f41-4e16-96d7-6750abedc710",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "49.462%",
              "dy": "90%",
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
                "text": "tick [tick_val == 0] / OUT_LED_BARRIER = true; \ntick_val = DEL_BLINK_BARRIER_10s"
              }
            },
            "position": {
              "distance": 0.5222222222222223,
              "offset": -129,
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
        "id": "92f9d89e-b4b8-424b-bba7-62717208eee7",
        "z": 91,
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
          "id": "a9e59a48-9f41-4e16-96d7-6750abedc710"
        },
        "target": {
          "id": "e7ce8ee8-58a5-4b69-8f70-0bdc03deef00",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "51.309%",
              "dy": "25%",
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
                "text": "tick [tick_val == 0] / OUT_LED_BARRIER = false; \ntick_val = DEL_BLINK_BARRIER_1s"
              }
            },
            "position": {
              "distance": 0.37014758223203725,
              "offset": -137.2288818359375,
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
        "id": "364009ba-6c9a-489e-9aed-9771dc35a6ff",
        "z": 92,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 608,
            "y": -138
          }
        ],
        "parent": "7983d3c9-99bd-46d5-ab39-a6a458d6e03a"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "009d9499-5d17-451c-bd72-f34873cc2c58"
        },
        "target": {
          "id": "a9e59a48-9f41-4e16-96d7-6750abedc710",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "31.183%",
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
                "text": "ACT_CMD_BARRIER_OPEN_FAST / OUT_LED_BARRIER = true; tick_val = DEL_BLINK_BARRIER_10s"
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
        "id": "072ecc7b-95a5-4800-a8e1-5a4edcfe9251",
        "z": 93,
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
          "id": "e04d33a3-54b7-4c80-94de-29c199f50ea3"
        },
        "target": {
          "id": "009d9499-5d17-451c-bd72-f34873cc2c58",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "50%",
              "dy": "23.333%",
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
        "id": "602ead02-a1ff-477b-8af8-e88149ab2f64",
        "z": 94,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "7983d3c9-99bd-46d5-ab39-a6a458d6e03a"
      },
      {
        "position": {
          "x": -146,
          "y": -325
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "e04d33a3-54b7-4c80-94de-29c199f50ea3",
        "z": 95,
        "parent": "7983d3c9-99bd-46d5-ab39-a6a458d6e03a",
        "embeds": [
          "9899919e-5154-4cbe-b0a3-7af329e0a4ec"
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
          "x": -146,
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
        "id": "9899919e-5154-4cbe-b0a3-7af329e0a4ec",
        "z": 96,
        "parent": "e04d33a3-54b7-4c80-94de-29c199f50ea3"
      },
      {
        "position": {
          "x": -231,
          "y": -255
        },
        "size": {
          "width": 188,
          "height": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_ACT_OFF",
            "fontSize": 11
          },
          "specification": {
            "text": "entry / OUT_LED_BARRIER = false\r\ntick [tick_val > 0] / tick_val--"
          }
        },
        "id": "009d9499-5d17-451c-bd72-f34873cc2c58",
        "z": 97,
        "parent": "7983d3c9-99bd-46d5-ab39-a6a458d6e03a",
        "embeds": [
          "d71712dd-94b5-4355-aaa0-e2d4c28c7c08"
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "009d9499-5d17-451c-bd72-f34873cc2c58"
        },
        "target": {
          "id": "009d9499-5d17-451c-bd72-f34873cc2c58",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "31.915%",
              "dy": "73.333%",
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
                "text": "ACT_CMD_BARRIER_KEEP_CLOSE / OUT_LED_BARRIER = false"
              }
            },
            "position": {
              "distance": 0.20366931758234252,
              "offset": -103.34365607041391,
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
        "id": "d71712dd-94b5-4355-aaa0-e2d4c28c7c08",
        "z": 98,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "009d9499-5d17-451c-bd72-f34873cc2c58"
      },
      {
        "position": {
          "x": 466,
          "y": -258
        },
        "size": {
          "width": 186,
          "height": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_ACT_BLINK_ON",
            "fontSize": 11
          },
          "specification": {
            "text": "entry / OUT_LED_BARRIER = true\r\ntick [tick_val > 0] / tick_val--"
          }
        },
        "id": "a9e59a48-9f41-4e16-96d7-6750abedc710",
        "z": 99,
        "parent": "7983d3c9-99bd-46d5-ab39-a6a458d6e03a"
      },
      {
        "position": {
          "x": 470,
          "y": -108
        },
        "size": {
          "width": 191,
          "height": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_ACT_BLINK_OFF",
            "fontSize": 11
          },
          "specification": {
            "text": "entry / OUT_LED_BARRIER = false\r\ntick [tick_val > 0] / tick_val--"
          }
        },
        "id": "e7ce8ee8-58a5-4b69-8f70-0bdc03deef00",
        "z": 100,
        "parent": "7983d3c9-99bd-46d5-ab39-a6a458d6e03a"
      },
      {
        "position": {
          "x": -218,
          "y": -80
        },
        "size": {
          "width": 190,
          "height": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_ACT_ON",
            "fontSize": 11
          },
          "specification": {
            "text": "entry / OUT_LED_BARRIER = true\r\ntick [tick_val > 0] / tick_val--"
          }
        },
        "id": "5c04fe7a-83ab-4741-9163-5834122fd9c7",
        "z": 101,
        "embeds": [
          "faa6725e-cd6f-4e3a-a16e-77630d647170"
        ],
        "parent": "7983d3c9-99bd-46d5-ab39-a6a458d6e03a"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "5c04fe7a-83ab-4741-9163-5834122fd9c7"
        },
        "target": {
          "id": "5c04fe7a-83ab-4741-9163-5834122fd9c7",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "85.263%",
              "dy": "66.667%",
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
                "text": "ACT_CMD_BARRIER_KEEP_OPEN / OUT_LED_BARRIER = true"
              }
            },
            "position": {
              "distance": 0.49999999999999994,
              "offset": 10,
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
        "id": "faa6725e-cd6f-4e3a-a16e-77630d647170",
        "z": 102,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "5c04fe7a-83ab-4741-9163-5834122fd9c7"
      },
      {
        "position": {
          "x": 251,
          "y": -493
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "bf9ab7d3-3359-4117-a2cb-d843ec3b8954",
        "z": 109,
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
          "x": 251,
          "y": -478
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
        "z": 110,
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
        "z": 111,
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
          "moduleName": "ActuatorStatechart",
          "statemachinePrefix": "actuatorStatechart",
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