Vim�UnDo� B�5b�L�t�=j�TJ� ">����,:�5?�   �           jsonDate.su = true;   V                          Uó�    _�                             ����                                                                                                                                                                                                                                                                                                                            �          �          v       U��     �                &var dbfunction = require('../db/db');5�_�                            ����                                                                                                                                                                                                                                                                                                                            �          �          v       U��     �   �   �          module.exports = router;�   �   �          �   �   �          });�   �   �              });�   �   �          E        res.render('', jsonDataArray); // Need the page to be render�   �   �          6    rm.getWageReport(query, function(jsonDataArray) {�   �   �          M    var query = {compid : compid, startDate : startDate, endDate : endDate};�   �   �          0    var endDate = Date.parse(req.body.enddate);�   �   �          4    var startDate = Date.parse(req.body.startdate);�   �   �          "    var compid = req.body.compid;�   �   �              var rm = new recModule();�   �   �          Crouter.post('/records_getWagesByMonth', function(req, res, next) {�   �   �          �   �   �          });�   �   �              });�   �   �          @        res.render('', jsonData); // Need the page to be render�   �   �          1    rm.getWageReport(query, function(jsonData) {�   �   �          M    var query = {compid : compid, startDate : startDate, endDate : endDate};�   �   �          0    var endDate = Date.parse(req.body.enddate);�   �   �          4    var startDate = Date.parse(req.body.startdate);�   �   �          "    var compid = req.body.compid;�   �   �              var rm = new recModule();�   �   �          Brouter.post('/records_getWagesByWeek', function(req, res, next) {�   �   �          �   �   �          });�   �   �              });�   �   �          @        res.render('', jsonData); // Need the page to be render�   �   �          2    rm.getWagesByWeek(query, function(jsonData) {�   �   �          J    var query = {userid: userid, startDate: startDate, endDate: endDate};�   �   �          0    var endDate = Date.parse(req.body.enddate);�   �   �          4    var startDate = Date.parse(req.body.startdate);�   �   �          "    var userid = req.body.userid;�   �   �              var rm = new recModule();�   �   �          Crouter.post('/records_getWagesByUsers', function(req, res, next) {�   �   �          �   �   �          });�   �   �              });�   �   �          
        }�   �   �          )            res.send({"success": true});�   �   �                  } else {�   �   �          =            res.send({"success": false, "msg":err.message});�   �   �                  if (err) {�   �   �                  res.type('json');�   �   �                  rm.db.close();�   �   �          :    rm.updateRecords(query, newrec, function(err, docs) {�   �   �              �   �   �          ;    newrec['outDate'] = moment(outDate, format).valueOf();�   �   �          9    newrec['inDate'] = moment(inDate, format).valueOf();�   �   �          �   �   �              var newrec = {};�   �   �              };�   �   �                  _id : _id�   �   �              var query = {�   �   �          '    var format = "YYYY-MM-DD hh:mm A";�   �   �          $    var outDate = req.body.outDate;�   �   �          "    var inDate = req.body.inDate;�   �   �              var _id = req.body.id;�   �   �              var rm = new recModule();�   �   �          Erouter.post('/supervisor/records_update', function(req, res, next) {�   �   �          });�   �   �              });�   �   �          
        }�   �   �          )            res.send({"success": true});�   �   �                  } else {�   �   �          =            res.send({"success": false, "msg":err.message});�   �   �                  if (err) {�   �   �                  res.type('json');�   �   �                  rm.db.close();�   �   �          .    rm.deleteRecords(_id, function(err, doc){�   �   �              console.log(_id);�   �   �              var _id = req.body.id;�   �   �              var rm = new recModule();�   �   �          Erouter.post('/supervisor/records_delete', function(req, res, next) {�   �   �          �   �   �          });�   �   �              });�   �   �          
        }�   �   �          5            res.send('Failed to delete, try again');�   �   �                  } else {�   �   �          .            res.send('Successfully deleted');�   �   �                  if (msg) {�   �   �          *    rm.deleteRecords(rid, function(msg) {�   �   �              var rid = req.params.rid;�   �   �              var rm = new recModule();�   �   �          Irouter.get('/supervisor/records_delete/:rid', function(req, res, next) {�   �   �          �   �   �          });�   �   �              });�   �   �          D        res.render('supervisor/supervisor_punch_report', jsonData);�   �   �          "        jsonData.moment = moment;�   �   �                  jsonData.tr = res.__;�   �   �          5    rm.searchRecords(query, su, function(jsonData) {�      �              };�   ~   �                  userid: userid�   }                 var query = {�   |   ~          ,    var su = req.path.search("supervisor");�   {   }          !    var userid = req.params.uid;�   z   |              var rm = new recModule();�   y   {          Grouter.get('/supervisor/records_show/:uid', function(req, res, next) {�   x   z          �   w   y          });�   v   x              });�   u   w          :        res.render('staff/staff_punch_report', jsonData);�   t   v          "        jsonData.moment = moment;�   s   u                  jsonData.tr = res.__;�   r   t          5    rm.searchRecords(query, su, function(jsonData) {�   q   s              };�   p   r                  userid: userid�   o   q              var query = {�   n   p          ,    var su = req.path.search("supervisor");�   m   o          !    var userid = req.params.uid;�   l   n              var rm = new recModule();�   k   m          <router.get('/records_show/:uid', function(req, res, next) {�   j   l          �   i   k          });�   h   j              });�   g   i          D        res.render('supervisor/supervisor_punch_report', jsonData);�   e   g                  jsonDate.su = true;�   d   f          "        jsonData.moment = moment;�   a   c                  jsonData.tr = res.__;�   `   b          1    rm.searchRecords(query, function(jsonData) {�   _   a          _    var query = {inDate : {"$gte" : starttime} , outDate : {"$lte": endtime}, userid: userid};�   ]   _          "    var userid = req.body.userid;�   \   ^          0    var endtime = Date.parse(req.body.enddate);�   [   ]          4    var starttime = Date.parse(req.body.startdate);�   Y   [          ,    var su = req.path.search("supervisor");�   X   Z          #    var userid = req.query.userid;�   W   Y          1    var endtime = Date.parse(req.query.enddate);�   V   X          5    var starttime = Date.parse(req.query.startdate);�   T   V              var rm = new recModule();�   S   U          Erouter.get('/supervisor/records_search/', function(req, res, next) {�   R   T          �   Q   S          });�   P   R              });�   O   Q                  });�   N   P                      sm.db.close();�   M   O          >            res.render('staff/staff_punch_report', jsonData);�   L   N          !            jsonData.su = false;�   K   M          &            jsonData.moment = moment;�   J   L          "            jsonData.tr = res.__;�   H   J          5        rm.searchRecords(query, function(jsonData) {�   G   I          k        var query = {inDate: {"$gte": starttime} , outDate: {"$lte": endtime}, userid: sessionDoc.userid};�   F   H          =    sm.getSessionInfo(sessionid, function(err, sessionDoc) {�   D   F          !            jsonData.su = false;�   C   E          2        rm.searchRecords(fq, function(jsonData) {�   B   D          )        var fq = { $or: [query, query1]}�   A   C          T        var query1 = {inDate: {"$gte": starttime} , outDate: null, userid: userid};�   @   B          `        var query = {inDate: {"$gte": starttime} , outDate: {"$lte": endtime}, userid: userid};�   ?   A          (        var userid = sessionDoc.userid;�   >   @          <    sm.getSessionInfo(sessionid, function(err, sessionDoc){�   <   >          +    var sessionid = req.cookies.sessionid;�   ;   =          0    var endtime = Date.parse(req.body.enddate);�   :   <          4    var starttime = Date.parse(req.body.startdate);�   9   ;          -    var sm = new sessionModule({db: rm.db});�   8   :              var rm = new recModule();�   7   9          :router.post('/records_search', function(req, res, next) {�   6   8          �   5   7          });�   4   6          #    rm.punch(query, function(){});�   3   5              var query = {userid: sid};�   2   4          %    var sid = req.cookies.sessionid;�   1   3              var rm = new recModule();�   0   2          7router.get('/punch_records', function(req, res, next){�   /   1          �   .   0          });�   -   /              });�   ,   .          
        }�   +   -          (            res.end('{success: true}');�   *   ,                  } else {�   )   +          �   (   *                  if (err) {�   '   )          ,    rm.delegate(query, function(err, msg) {�   &   (          G    var query = {userid : userid, sessionid : sessionid, flag : flag};�   %   '          *    var flag = parseInt(req.params.flag);�   $   &          +    var sessionid = req.cookies.sessionid;�   #   %          $    var userid = req.params.userid;�   "   $              var rm = new recModule();�   !   #          Srouter.get('/supervisor/delegate_action/:userid/:flag', function(req, res, next) {�       "          �      !          });�                     });�                M        utils.render('supervisor/supervisor_delegate', ret)(req, res, next);�                <    rm.showUsersForDelegate(sessionid, function(err, ret) {�                +    var sessionid = req.cookies.sessionid;�                    var rm = new recModule();�                =router.get('/supervisor_delegate', function(req, res, next){�                */�                });�                    });�                N        utils.render('supervisor/supervisor_delegate', dels)(req, res, next);�                
        }�                            delegate = true;�                        if (dels) {�                        var delegate = false;�                2    rm.checkDelegate(query, function(err, dels) {�                    query = {userid : userid};�                !    var userid = req.params.uid;�                +    var sessionid = req.cookies.sessionid;�                    var rm = new recModule();�                =router.get('/staff_delegate:uid', function(req, res, next) {�   
             /*�   	             �      
          !var utils = require('../utils');�      	          1var sessionModule = require('../sessionModule');�                )var recModule = require('../recModule');�                8var db = monk('mongodb://localhost:27017/punchsystem');�                var monk = require('monk');�                 var moment = require('moment');5�_�                       !    ����                                                                                                                                                                                                                                                                                                                            �          �          v       U��     �          �      "var express = require('express');5�_�                            ����                                                                                                                                                                                                                                                                                                                            �          �          v       U��     �          �      !var express = require('express');5�_�                           ����                                                                                                                                                                                                                                                                                                                            �          �          v       U��     �         �      var router = express.Router();5�_�                           ����                                                                                                                                                                                                                                                                                                                            �          �          v       U��    �          �       var express = require('express')5�_�      	              G        ����                                                                                                                                                                                                                                                                                                                            G           I           V        U��^     �   F   G          <    sm.getSessionInfo(sessionid, function(err, sessionDoc) {   j        var query = {inDate: {"$gte": starttime} , outDate: {"$lte": endtime}, userid: sessionDoc.userid};   4        rm.searchRecords(query, function(jsonData) {5�_�      
           	   F        ����                                                                                                                                                                                                                                                                                                                            G           G           V        U��_     �   E   F          =======5�_�   	              
   F        ����                                                                                                                                                                                                                                                                                                                            F           F           V        U��`     �   E   F          >>>>>>> dev5�_�   
                 E       ����                                                                                                                                                                                                                                                                                                                            F           F           V        U��a     �   D   E                       jsonData.su = false;5�_�                    >        ����                                                                                                                                                                                                                                                                                                                            E           E           V        U��d     �   =   >          <<<<<<< HEAD5�_�                    U        ����                                                                                                                                                                                                                                                                                                                            U          W          V       U��y     �   T   U          3    var starttime = Date.parse(req.body.startdate);   /    var endtime = Date.parse(req.body.enddate);   !    var userid = req.body.userid;5�_�                    T        ����                                                                                                                                                                                                                                                                                                                            T           U           V        U��z     �   S   T          =======   >>>>>>> dev5�_�                    O        ����                                                                                                                                                                                                                                                                                                                            T           T           V        U��~     �   N   O          <<<<<<< HEAD5�_�                    V        ����                                                                                                                                                                                                                                                                                                                            V          W          V       U���     �   U   V          <<<<<<< HEAD   =======5�_�                    X        ����                                                                                                                                                                                                                                                                                                                            V          V          V       U���     �   W   X          >>>>>>> dev5�_�                    V       ����                                                                                                                                                                                                                                                                                                                            V          V          V       U���     �   U   V          !        jsonData.moment = moment;5�_�                    B   (    ����                                                                                                                                                                                                                                                                                                                            V          V          V       U���    �   A   C   �      (        var fq = { $or: [query, query1]}5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             Uñ�    �   �   �              console.log(_id);5�_�                     V       ����                                                                                                                                                                                                                                                                                                                                                             Uó�    �   U   W   �              jsonDate.su = true;5�_�                           ����                                                                                                                                                                                                                                                                                                                            �          �          v       U��     �         �      var router = express.Router()5��