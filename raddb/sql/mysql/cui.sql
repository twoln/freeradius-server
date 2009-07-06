#
# Table structure for table 'cui'
#
CREATE TABLE `cui` (
  `clientipaddress` varchar(15) NOT NULL default '',
  `callingstationid` varchar(50) NOT NULL default '',
  `username` varchar(64) NOT NULL default '',
  `cui` varchar(32) NOT NULL default '',
  `creationdate` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `lastaccounting` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`username`,`clientipaddress`,`callingstationid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
