// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.sjsu.bikelet.web;

import com.sjsu.bikelet.domain.BillTransaction;
import com.sjsu.bikelet.service.BillService;
import com.sjsu.bikelet.service.BillTransactionService;
import com.sjsu.bikelet.web.BillTransactionController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect BillTransactionController_Roo_Controller {
    
    @Autowired
    BillTransactionService BillTransactionController.billTransactionService;
    
    @Autowired
    BillService BillTransactionController.billService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String BillTransactionController.create(@Valid BillTransaction billTransaction, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, billTransaction);
            return "billtransactions/create";
        }
        uiModel.asMap().clear();
        billTransactionService.saveBillTransaction(billTransaction);
        return "redirect:/billtransactions/" + encodeUrlPathSegment(billTransaction.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String BillTransactionController.createForm(Model uiModel) {
        populateEditForm(uiModel, new BillTransaction());
        return "billtransactions/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String BillTransactionController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("billtransaction", billTransactionService.findBillTransaction(id));
        uiModel.addAttribute("itemId", id);
        return "billtransactions/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String BillTransactionController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("billtransactions", billTransactionService.findBillTransactionEntries(firstResult, sizeNo));
            float nrOfPages = (float) billTransactionService.countAllBillTransactions() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("billtransactions", billTransactionService.findAllBillTransactions());
        }
        addDateTimeFormatPatterns(uiModel);
        return "billtransactions/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String BillTransactionController.update(@Valid BillTransaction billTransaction, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, billTransaction);
            return "billtransactions/update";
        }
        uiModel.asMap().clear();
        billTransactionService.updateBillTransaction(billTransaction);
        return "redirect:/billtransactions/" + encodeUrlPathSegment(billTransaction.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String BillTransactionController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, billTransactionService.findBillTransaction(id));
        return "billtransactions/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String BillTransactionController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        BillTransaction billTransaction = billTransactionService.findBillTransaction(id);
        billTransactionService.deleteBillTransaction(billTransaction);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/billtransactions";
    }
    
    void BillTransactionController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("billTransaction_startdate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("billTransaction_enddate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void BillTransactionController.populateEditForm(Model uiModel, BillTransaction billTransaction) {
        uiModel.addAttribute("billTransaction", billTransaction);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("bills", billService.findAllBills());
    }
    
    String BillTransactionController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
