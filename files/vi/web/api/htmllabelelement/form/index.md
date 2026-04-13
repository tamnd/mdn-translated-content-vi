---
title: "HTMLLabelElement: thuộc tính form"
short-title: form
slug: Web/API/HTMLLabelElement/form
page-type: web-api-instance-property
browser-compat: api.HTMLLabelElement.form
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`form`** của giao diện {{domxref("HTMLLabelElement")}} trả về một đối tượng {{domxref("HTMLFormElement")}} sở hữu {{domxref("HTMLLabelElement.control", "control")}} liên kết với {{HTMLElement("label")}} này, hoặc `null` nếu nhãn này không liên kết với phần tử [labelable](/en-US/docs/Web/HTML/Guides/Content_categories#labelable) [form-associated](/en-US/docs/Web/HTML/Guides/Content_categories#form-associated_content) ({{htmlelement("button")}}, {{htmlelement("input")}}, {{htmlelement("output")}}, {{htmlelement("select")}}, {{htmlelement("textarea")}} hoặc [các phần tử tùy chỉnh liên kết biểu mẫu](https://html.spec.whatwg.org/multipage/custom-elements.html#form-associated-custom-element)) được sở hữu bởi một biểu mẫu.

Không giống như các [phần tử liên kết biểu mẫu](/en-US/docs/Web/HTML/Guides/Content_categories#form-associated_content), phần tử `<label>` không có thuộc tính [`form`](/en-US/docs/Web/HTML/Reference/Attributes/form). Thuộc tính này không phản ánh bất kỳ thuộc tính HTML nào, mà chỉ là lối tắt cho `label.control.form`.

## Giá trị

Một {{domxref("HTMLFormElement")}} hoặc `null`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLLabelElement")}}
- {{domxref("HTMLInputElement.form")}}
- {{domxref("HTMLFormElement")}}
- {{HTMLElement("label")}}
- [Hướng dẫn về biểu mẫu HTML](/en-US/docs/Learn_web_development/Extensions/Forms)
