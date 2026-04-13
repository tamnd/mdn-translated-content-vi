---
title: "HTMLOptionElement: thuộc tính label"
short-title: label
slug: Web/API/HTMLOptionElement/label
page-type: web-api-instance-property
browser-compat: api.HTMLOptionElement.label
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`label`** của {{domxref("HTMLOptionElement")}} đại diện cho văn bản hiển thị cho một tùy chọn trong phần tử {{htmlelement("select")}} hoặc là một phần của danh sách gợi ý trong phần tử {{htmlelement("datalist")}}. Nó phản ánh thuộc tính [`label`](/en-US/docs/Web/HTML/Reference/Elements/option#label) của phần tử {{htmlelement("option")}}.

Nếu thuộc tính bị bỏ qua hoặc là chuỗi rỗng, thuộc tính `label` trả về nội dung {{domxref("HTMLOptionElement.text", "text")}} của phần tử.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const optionElement = document.getElementById("exampleOption");
console.log(`Nhãn tùy chọn: ${optionElement.label}`);
optionElement.label = "Nhãn đã cập nhật";
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLOptionElement.value")}}
- {{HTMLElement("select")}}
- {{HTMLElement("datalist")}}
- {{HTMLElement("optgroup")}}
