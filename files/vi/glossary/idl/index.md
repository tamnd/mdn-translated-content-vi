---
title: IDL
slug: Glossary/IDL
page-type: glossary-definition
sidebar: glossarysidebar
---

**IDL** (_Interface Description Language_ - Ngôn ngữ mô tả giao diện) là một ngôn ngữ chung, được sử dụng để xác định các giao diện đối tượng độc lập với bất kỳ ngôn ngữ lập trình cụ thể nào.

## Thuộc tính nội dung và thuộc tính IDL

Trong HTML, hầu hết các thuộc tính có hai mặt: **thuộc tính nội dung** và **thuộc tính IDL**.

Thuộc tính nội dung là thuộc tính bạn đặt từ nội dung (mã HTML) và bạn có thể đặt hoặc lấy nó qua {{domxref("element.setAttribute()")}} hoặc {{domxref("element.getAttribute()")}}. Thuộc tính nội dung luôn là một chuỗi ngay cả khi giá trị mong đợi là một số nguyên. Ví dụ, để đặt `maxlength` của phần tử {{HTMLElement("input")}} thành 42 bằng cách sử dụng thuộc tính nội dung, bạn phải gọi `setAttribute("maxlength", "42")` trên phần tử đó.

Thuộc tính IDL còn được gọi là thuộc tính JavaScript. Đây là các thuộc tính bạn có thể đọc hoặc đặt bằng cách sử dụng các thuộc tính JavaScript như `element.foo`. Thuộc tính IDL sẽ luôn sử dụng (nhưng có thể biến đổi) thuộc tính nội dung cơ bản để trả về một giá trị khi bạn lấy nó và sẽ lưu thứ gì đó vào thuộc tính nội dung khi bạn đặt nó. Nói cách khác, các thuộc tính IDL về bản chất phản ánh các thuộc tính nội dung.

Hầu hết thời gian, các thuộc tính IDL sẽ trả về giá trị của chúng như chúng thực sự được sử dụng. Ví dụ, `type` mặc định cho các phần tử {{HTMLElement("input")}} là "text", vì vậy nếu bạn đặt `input.type="foobar"`, phần tử `<input>` sẽ là loại text (về giao diện và hành vi) nhưng giá trị của thuộc tính nội dung "type" sẽ là "foobar". Tuy nhiên, thuộc tính IDL `type` sẽ trả về chuỗi "text".

Các thuộc tính IDL không phải lúc nào cũng là chuỗi; ví dụ, `input.maxlength` là một số (một số nguyên có dấu). Khi sử dụng các thuộc tính IDL, bạn đọc hoặc đặt các giá trị của kiểu mong muốn, vì vậy `input.maxlength` luôn trả về một số và khi bạn đặt `input.maxlength`, nó cần một số. Nếu bạn truyền một kiểu khác, nó tự động được chuyển đổi thành số theo các quy tắc JavaScript tiêu chuẩn cho việc chuyển đổi kiểu.

Các thuộc tính IDL có thể [phản ánh các kiểu khác](https://html.spec.whatwg.org/multipage/urls-and-fetching.html#reflecting-content-attributes-in-idl-attributes) như unsigned long, URL, boolean, v.v. Thật không may, không có quy tắc rõ ràng và cách các thuộc tính IDL hoạt động kết hợp với các thuộc tính nội dung tương ứng phụ thuộc vào thuộc tính. Hầu hết thời gian, nó sẽ tuân theo [các quy tắc được đặt ra trong đặc tả](https://html.spec.whatwg.org/multipage/urls-and-fetching.html#reflecting-content-attributes-in-idl-attributes), nhưng đôi khi không. Các đặc tả HTML cố gắng làm cho điều này thân thiện với nhà phát triển nhất có thể, nhưng vì nhiều lý do (chủ yếu là lịch sử), một số thuộc tính hoạt động kỳ lạ (`select.size`, ví dụ) và bạn nên đọc các đặc tả để hiểu chính xác cách chúng hoạt động.

## Xem thêm

- [IDL](https://en.wikipedia.org/wiki/Interface_description_language) trên Wikipedia
- [Tài liệu tham khảo thuộc tính HTML](/en-US/docs/Web/HTML/Reference/Attributes)
- [Interface Definition Language](https://people.eecs.berkeley.edu/~messer/netappc/Supplements/10-idl.pdf)
