---
title: "SubmitEvent: thuộc tính submitter"
short-title: submitter
slug: Web/API/SubmitEvent/submitter
page-type: web-api-instance-property
browser-compat: api.SubmitEvent.submitter
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`submitter`** được tìm thấy trong
giao diện {{domxref("SubmitEvent")}} chỉ định nút submit hoặc phần tử khác
đã được gọi để khiến biểu mẫu được submit.

## Giá trị

Một phần tử, chỉ ra phần tử đã gửi
sự kiện {{domxref("HTMLFormElement.submit_event", "submit")}} đến biểu mẫu. Mặc dù đây
thường là phần tử {{HTMLElement("input")}} có [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) là `submit` hoặc phần tử {{HTMLElement("button")}} có [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) là `submit`, nhưng có thể là một phần tử khác đã khởi tạo
quá trình submit.

Nếu việc submit không được kích hoạt bởi một nút nào đó, giá trị của `submitter` là `null`.

## Ví dụ

Xem [`SubmitEvent`](/en-US/docs/Web/API/SubmitEvent#examples) để biết code ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
