jQuery(document).ready(function() {
  jQuery("#list4").jqGrid({
    url:'/admin/productizers',
    datatype: "json",
    loadComplete: function(){$('#list4').find('a').addClass('colorbox');$('.colorbox').colorbox();},
    height: 250,
      colNames:['Id','Name','Supplier', 'Quantity', 'Next Deliver', 'Number of notes','Create Note', 'Show Note'],
      colModel:[
        {name:'id',index:'id', width:60, sorttype:"int", align:"center"},
        {name:'name',index:'name', width:90, sorttype:"date", align:"center"},
        {name:'supplier',index:'supplier', width:100, align:"center"},
        {name:'quantity',index:'quantity', width:80, align:"center",sorttype:"float"},
        {name:'next_deliver',index:'next_deliver', width:80, align:"center",sorttype:"date"},
        {name:'number_notes',index:'number_notes', width:80, align:"center",sorttype:"float"},
        {name:'create_note',index:'create_note', width:150, sortable:false, edittype:'select',align:"center",formatter:'showlink',formatoptions:{baseLinkUrl:'/notes/new', addParam: '&action=edit'} },
        {name:'show_note',index:'show_note', width:150, sortable:false, edittype:'select',align:"center",formatter:'showlink',formatoptions:{baseLinkUrl:'/product/notes', addParam: '&action=show'} }
      ],
      rowNum:10,
      autowidth: true,
      rowList:[10,20,30],
      pager: '#pager4',
      sortname: 'id',
      viewrecords: true,
      caption: "Products"
  });
  jQuery("#list4").jqGrid('navGrid', '#pager4',{edit:false,add:false,del:false});

});