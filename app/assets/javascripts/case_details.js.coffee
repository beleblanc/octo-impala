# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('.datepicker').datepicker({firstDay:1, changeYear:true, dateFormat:'yy-mm-dd', yearRange:'c-100:c', changeMonth:true })


  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').slideUp()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

	$('ul.nav-tabs a').click (e) ->
	  e.preventDefault
	  $(this).tab 'show'

	$('a[data-toggle="tab"]').on 'show', (e) ->
	  activated = $(e.target).attr('href')
	  previous = $(e.relatedTarget).attr('href')
	  $(previous).slideUp();
	  $(activated).slideDown();
	
	constituencies = $('#case_detail_constituency_id').html()
	$('#case_detail_region_id').change ->
		region = $('#case_detail_region_id :selected').text()
		option = $(constituencies).filter("optgroup[label=#{region}]").html()
		if option
			$('#case_detail_constituency_id').html(option)
			$('#case_detail_constituency_id').show()
		else
			$('#case_detail_constituency_id').hide()
			$('#case_detail_constituency_id').empty()
			
	$('.datatable').dataTable	
		sDom: "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
		sPaginationType: "bootstrap",
		bJQueryUI: true,

	$('#case_detail_charge_ids').chosen()