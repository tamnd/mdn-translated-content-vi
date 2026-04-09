---
title: "ARIA: thuộc tính aria-modal"
short-title: aria-modal
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-modal
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-modal
sidebar: accessibilitysidebar
---

Thuộc tính `aria-modal` cho biết một phần tử có mang tính modal khi được hiển thị hay không.

## Mô tả

Một phần nội dung được xem là "modal" khi việc điều hướng bị giới hạn trong chính khu vực đó và phần nền xung quanh, gồm các phần tử tổ tiên và phần tử anh em của modal, bị ẩn đi. Đặt `aria-modal="true"` trên các vùng chứa có vai trò [`dialog`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/dialog_role) và [`alertdialog` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alertdialog_role) sẽ thông báo cho người dùng công nghệ hỗ trợ rằng có một phần tử "modal" xuất hiện, nhưng điều đó không tự biến phần tử thành modal. Những khả năng làm cho phần tử thực sự modal phải do nhà phát triển triển khai.

> [!NOTE]
> ARIA chỉ sửa đổi cây trợ năng, tức là chỉ thay đổi cách công nghệ hỗ trợ trình bày nội dung cho người dùng. ARIA không thay đổi chức năng hay hành vi của phần tử. Để tạo hiệu ứng modal, bạn phải dùng JavaScript để quản lý hành vi, focus và các trạng thái ARIA.

Chỉ có ý nghĩa đối với các vùng chứa `dialog` và `alertdialog`, việc đặt `aria-modal="true"` sẽ cho công nghệ hỗ trợ biết rằng người dùng chỉ có thể tương tác với nội dung trong hộp thoại modal hoặc truy cập nội dung khác của trang sau khi đóng hộp thoại hoặc làm mất focus của nó.

Hộp thoại modal là khi nội dung được hiển thị và tương tác của người dùng chỉ bị giới hạn trong phần đó cho đến khi nó được đóng.

Khi tạo hộp thoại modal, `aria-modal="true"` cho công nghệ hỗ trợ biết rằng các cửa sổ bên dưới hộp thoại hiện tại không thuộc phần nội dung modal.

Khi một phần tử modal được hiển thị, focus nên được đặt vào chính modal đó. Focus cần được "giữ" bên trong modal khi nó đang hiển thị, cho đến khi nó bị đóng. Khi đó công nghệ hỗ trợ (<abbr>AT</abbr>) có thể điều hướng nội dung trong modal và hiểu được phạm vi của nội dung modal. Thuộc tính `aria-modal` giúp AT truyền đạt ranh giới của modal và phân biệt nó với phần nội dung còn lại của trang. Khi đóng modal, focus nên quay trở lại phần tử đã kích hoạt modal.

Hãy bảo đảm modal có thể được điều khiển chỉ bằng các phần tử con của nó. Nếu hộp thoại modal có nút đóng, nút đó phải là phần tử con nằm trong vùng chứa modal trong DOM.

Khi một phần tử modal được hiển thị, tác giả **nên** đánh dấu toàn bộ nội dung khác là inert, chẳng hạn như "inert subtree" trong HTML. Nội dung bị vô hiệu hóa không phải là nội dung inert. Nội dung inert không thể được tương tác bằng cả chế độ duyệt bình thường lẫn các chế độ duyệt chuyên biệt như caret browsing, vốn cho phép người dùng công nghệ hỗ trợ khám phá trang theo chi tiết. Điều này bao gồm cả nội dung bị vô hiệu hóa, vì nội dung của nó vẫn có thể mang ý nghĩa.

Thuộc tính [`inert`](/en-US/docs/Web/HTML/Reference/Global_attributes/inert) là một thuộc tính boolean, cho biết rằng khi nó xuất hiện thì bản thân phần tử và toàn bộ hậu duệ có shadow tree của nó sẽ trở thành inert.

Việc thêm `aria-modal="true"` vào [`dialog`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/dialog_role) hoặc [`alertdialog`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alertdialog_role) sẽ loại bỏ yêu cầu phải đặt [`aria-hidden`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-hidden) lên nội dung nền, vì `aria-modal` thông báo cho công nghệ hỗ trợ rằng nội dung bên ngoài hộp thoại là inert. Lưu ý rằng mặc dù hỗ trợ cho phần tử {{HTMLElement("dialog")}} khá tốt, việc kiểm thử kỹ lưỡng cách triển khai của bạn là cực kỳ quan trọng.

Nếu một hộp thoại không phải modal, tức là không có nền inert và focus không bị giới hạn trong hộp thoại, thì hãy đặt `aria-modal="false"` hoặc bỏ hoàn toàn thuộc tính này.

## Ví dụ

```html
<div id="backdrop" class="no-scroll">
  <div
    role="alertdialog"
    aria-modal="true"
    aria-labelledby="dialog_label"
    aria-describedby="dialog_desc">
    <h2 id="dialog_label">Confirmation</h2>
    <div id="dialog_desc">
      <p>Are you sure you want to delete this file?</p>
    </div>
    <button id="close-btn" type="button">No. Close this popup.</button>
    <button id="confirm-btn" type="button">Yes. Delete the file.</button>
  </div>
</div>
```

```js
document.getElementById("close-btn").addEventListener("click", () => {
  closeDialog();
});

document.getElementById("confirm-btn").addEventListener("click", (event) => {
  deleteFile();
});
```

Ví dụ rút gọn này chứa một `alertdialog` nằm bên trong một lớp nền toàn màn hình không thể cuộn.

[`role="alertdialog"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alertdialog_role) xác định phần tử đóng vai trò là vùng chứa hộp thoại cảnh báo. [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) cung cấp tên truy cập cho hộp thoại cảnh báo bằng cách tham chiếu đến phần tử cung cấp tiêu đề của hộp thoại. Thuộc tính [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby) cung cấp cho hộp thoại cảnh báo một {{glossary("accessible description")}} bằng cách tham chiếu đến nội dung hộp thoại mô tả thông điệp hoặc mục đích chính của hộp thoại.

`aria-modal="true"` thông báo cho người dùng công nghệ hỗ trợ rằng nội dung bên dưới hộp thoại không thể tương tác trong khi phần tử có khai báo `role="alertdialog"` đang có focus.

Thuộc tính `aria-modal` cho công nghệ hỗ trợ biết rằng có modal hiện diện để việc vô hiệu hóa nội dung phía sau modal có thể được truyền đạt đến người dùng AT. Giống như mọi thuộc tính ARIA khác, bản thân `aria-modal` không ảnh hưởng đến chức năng của trang; việc quản lý focus, vô hiệu hóa các phần tử nền, tính tương tác trên các phần tử nền và khả năng lấy focus ra khỏi alertdialog đều phải được quản lý bằng JavaScript.

## Giá trị

- `false` (mặc định)
  - : Phần tử không phải modal.
- `true`
  - : Phần tử là modal.

## Giao diện liên quan

- {{domxref("Element.ariaModal")}}
  - : Thuộc tính [`ariaModal`](/en-US/docs/Web/API/Element/ariaModal), thuộc giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-modal`.
- {{domxref("ElementInternals.ariaModal")}}
  - : Thuộc tính [`ariaModal`](/en-US/docs/Web/API/ElementInternals/ariaModal), thuộc giao diện {{domxref("ElementInternals")}}, phản ánh giá trị của thuộc tính `aria-modal`.

## Vai trò liên quan

Được dùng trong các vai trò:

- [`window`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/window_role)

Kế thừa vào các vai trò:

- [`alertdialog`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alertdialog_role)
- [`dialog`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/dialog_role)

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- Phần tử HTML {{HTMLElement("dialog")}}
- [`alertdialog` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alertdialog_role)
- [`dialog` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/dialog_role)
- HTML [`inert` global attribute](/en-US/docs/Web/HTML/Reference/Global_attributes/inert)
- Thuộc tính [`inert`](/en-US/docs/Web/API/HTMLElement/inert) của HTMLElement API
