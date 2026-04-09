---
title: "ARIA: vai trò alertdialog"
short-title: alertdialog
slug: Web/Accessibility/ARIA/Reference/Roles/alertdialog_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#alertdialog
sidebar: accessibilitysidebar
---

Vai trò **alertdialog** được dùng cho các hộp thoại cảnh báo dạng modal, làm gián đoạn luồng công việc của người dùng để truyền đạt một thông điệp quan trọng và yêu cầu phản hồi.

## Mô tả

Vai trò `alertdialog` được dùng để thông báo cho người dùng về thông tin khẩn cấp cần được chú ý ngay lập tức. Việc thêm `role="alertdialog"` vào phần tử chứa hộp thoại giúp công nghệ hỗ trợ nhận biết nội dung là một nhóm riêng biệt và được tách khỏi phần còn lại của trang. Ví dụ gồm các thông báo lỗi cần xác nhận và các lời nhắc xác nhận hành động khác.

Đúng như tên gọi, `alertdialog` là sự kết hợp của vai trò [`dialog`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/dialog_role) và [`alert`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alert_role). `alertdialog` là một dạng `dialog` có các trường hợp sử dụng tương tự `alert`, nhưng dành cho trường hợp cần phản hồi từ người dùng.

> [!NOTE]
> Vai trò `alertdialog` chỉ nên được dùng cho các thông báo cảnh báo có các điều khiển tương tác đi kèm. Nếu hộp thoại cảnh báo chỉ chứa nội dung tĩnh và hoàn toàn không có điều khiển tương tác, hãy dùng [`alert`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alert_role) thay thế.

Là một dạng hộp thoại, các trạng thái, thuộc tính và yêu cầu tiêu điểm bàn phím của vai trò [`dialog`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/dialog_role) cũng áp dụng cho vai trò `alertdialog`.

Vì tính khẩn cấp của nó và việc làm gián đoạn luồng công việc của người dùng, hộp thoại cảnh báo nên là [modal](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-modal).

Hộp thoại cảnh báo phải có ít nhất một điều khiển có thể nhận tiêu điểm - chẳng hạn Xác nhận, Đóng và Hủy - và tiêu điểm phải được chuyển tới điều khiển đó khi hộp thoại xuất hiện. Hộp thoại cảnh báo có thể có thêm các điều khiển tương tác khác như trường văn bản và hộp kiểm.

Vai trò `alertdialog` không được dùng để thay thế các hộp thoại khác, bao gồm hộp thoại `alert` không cần xác nhận ([`Window.alert()`](/en-US/docs/Web/API/Window/alert)) và lời nhắc ([`Window.prompt()`](/en-US/docs/Web/API/Window/prompt)).

Chỉ thêm `role="alertdialog"` là chưa đủ để làm cho hộp thoại cảnh báo có thể truy cập được. Những việc sau cũng cần được thực hiện:

- Hộp thoại cảnh báo phải được gắn nhãn đúng cách
- Tiêu điểm bàn phím phải được quản lý đúng cách

`alertdialog` phải có một tên truy cập, được định nghĩa bằng [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) hoặc [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label). Văn bản của hộp thoại cảnh báo phải có {{glossary("accessible description")}} bằng [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby).

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby)
  - : Dùng thuộc tính này để gắn nhãn cho alertdialog. Thuộc tính `aria-labelledby` thường là ID của phần tử dùng để đặt tiêu đề cho alertdialog.

- [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby)
  - : Dùng thuộc tính này để bao hàm phần mô tả nội dung của hộp thoại cảnh báo. Giá trị của `aria-describedby` thường là ID của phần tử chứa thông điệp của hộp thoại cảnh báo, thường nằm ngay sau tiêu đề.

## Ví dụ

### Ví dụ 1: Một hộp thoại cảnh báo cơ bản

```html
<div
  role="alertdialog"
  aria-labelledby="dialog1Title"
  aria-describedby="dialog1Desc">
  <div role="document" tabindex="0">
    <h2 id="dialog1Title">Phiên đăng nhập của bạn sắp hết hạn</h2>
    <p id="dialog1Desc">Để gia hạn phiên, hãy nhấn nút OK</p>
    <button>OK</button>
  </div>
</div>
```

Đoạn mã trên cho thấy cách đánh dấu một hộp thoại cảnh báo chỉ cung cấp một thông điệp và một nút OK.

### Ví dụ 2: Hộp thoại xác nhận với hai lựa chọn

```html
<div
  id="alert_dialog"
  role="alertdialog"
  aria-modal="true"
  aria-labelledby="dialog_label"
  aria-describedby="dialog_desc">
  <h2 id="dialog_label">Xác nhận</h2>
  <div id="dialog_desc">
    <p>Bạn có chắc chắn muốn xóa hình ảnh này không?</p>
    <p>Thay đổi này không thể hoàn tác.</p>
  </div>
  <ul>
    <li>
      <button id="close-btn" type="button">Không</button>
    </li>
    <li>
      <button id="confirm-btn" type="button" aria-controls="form">Có</button>
    </li>
  </ul>
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

## Đặc tả

{{Specifications}}

## Xem thêm

- Phần tử HTML {{HTMLElement("dialog")}}
- [vai trò `dialog`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/dialog_role)
- [vai trò `alert`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alert_role)
- Thuộc tính [`aria-modal`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-modal)
- [`Window.alert()`](/en-US/docs/Web/API/Window/alert)
- [`Window.prompt()`](/en-US/docs/Web/API/Window/prompt)
