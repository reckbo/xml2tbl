require 'api/expat'
coclass 'xml2tbl'
coinsert 'jexpat'

NB. ========================================
NB. Define expat callbacks

expat_initx=: 3 : 0
  Line=: 0$0
  Lines=: 0 0$0
  Started=:0
)

expat_start_elementx=: 4 : 0
  'Elem Att Val'=. x
  if. Elem -: 'item' do.
    if. Started do.
      Lines=: Lines,Line
      Line=: 0$0
    else.
      Started=:1
    end.
  end.
)

expat_end_elementx=: 3 : 0
  if. Started do.
    Line=: Line , < expat_characterData
  end.
)

NB. ========================================

NB. xml2tbl fread 'test/test.xml'
xml2tbl=: 3 : 0
  expat_parse_xml y
  Lines -."1 a:
)

xml2tbl_z_=: xml2tbl_xml2tbl_

