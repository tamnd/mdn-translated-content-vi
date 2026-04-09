---
title: Thuộc tính toàn cục HTML autofocus
short-title: autofocus
slug: Web/HTML/Reference/Global_attributes/autofocus
page-type: html-attribute
browser-compat: html.global_attributes.autofocus
sidebar: htmlsidebar
---

Thuộc tính toàn cục **`autofocus`** [global attribute](/en-US/docs/Web/HTML/Reference/Global_attributes) là thuộc tính Boolean cho biết liệu phần tử có nên được lấy tiêu điểm khi tải trang hay không, hoặc nếu nó được lồng trong phần tử {{htmlelement("dialog")}} hoặc [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover), thì khi `<dialog>` hoặc popover được hiển thị.

```html
<input name="q" autofocus />
```

Chỉ một phần tử trong tài liệu, phần tử `<dialog>`, hoặc popover có thể có thuộc tính này được chỉ định. Nếu được áp dụng cho nhiều phần tử, phần tử đầu tiên có thể lấy tiêu điểm sẽ nhận được tiêu điểm.

> [!NOTE]
> Thuộc tính `autofocus` áp dụng cho tất cả các phần tử, không chỉ các điều khiển form. Ví dụ, nó có thể được dùng trên vùng [contenteditable](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable).

> [!NOTE]
> Khi tải trang, nếu [định danh đoạn URI](/en-US/docs/Web/URI/Reference/Fragment) được chỉ định và xác định một phần tử, phần tử có thuộc tính `autofocus` không nhận tiêu điểm qua thuộc tính `autofocus`. Nhìn chung, phần tử được chỉ định bởi đoạn sẽ nhận tiêu điểm thay thế.

## Vấn đề trợ năng

Tự động lấy tiêu điểm vào điều khiển form có thể gây nhầm lẫn cho những người khiếm thị dùng công nghệ đọc màn hình và những người có khuyết tật về nhận thức. Khi `autofocus` được gán, các trình đọc màn hình "dịch chuyển tức thì" người dùng của họ đến điều khiển form mà không cảnh báo trước.

Hãy cân nhắc cẩn thận về khả năng tiếp cận khi áp dụng thuộc tính `autofocus`. Tự động lấy tiêu điểm vào một điều khiển có thể gây ra cuộn trang khi tải. Tiêu điểm cũng có thể khiến bàn phím ảo hiển thị trên một số thiết bị cảm ứng. Trong khi trình đọc màn hình sẽ thông báo nhãn của điều khiển form nhận tiêu điểm, trình đọc màn hình sẽ không thông báo bất cứ điều gì trước nhãn, và người dùng có thị lực trên thiết bị nhỏ sẽ bỏ lỡ ngữ cảnh được tạo bởi nội dung trước đó.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
