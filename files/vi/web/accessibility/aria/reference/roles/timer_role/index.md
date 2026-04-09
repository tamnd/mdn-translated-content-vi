---
title: "ARIA: vai trò timer"
short-title: timer
slug: Web/Accessibility/ARIA/Reference/Roles/timer_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#timer
sidebar: accessibilitysidebar
---

Vai trò **`timer`** cho công nghệ hỗ trợ biết rằng một phần tử là một bộ đếm số liệt kê lượng thời gian đã trôi qua từ một điểm bắt đầu hoặc thời gian còn lại cho tới một điểm kết thúc. Công nghệ hỗ trợ sẽ không thông báo các cập nhật của timer vì nó có giá trị ngầm định của [`aria-live`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-live) là `off`.

```html
<div role="timer" id="eggtimer">0</div>
```

Điều này xác định phần tử `div` này là một timer không còn thời gian nào.

## Mô tả

Vai trò `timer` cho công nghệ hỗ trợ biết rằng phần này của nội dung web là một live region chứa timer liệt kê thời gian còn lại hoặc thời gian đã trôi qua. Văn bản bên trong của timer nên là một phép đo thời gian hiện tại đang được cập nhật. Mặc dù giá trị không nhất thiết phải phân tích được bởi máy, nó nên được cập nhật liên tục theo các khoảng thời gian đều đặn trừ khi timer bị tạm dừng hoặc đạt tới điểm kết thúc.

Cùng với [`alert`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alert_role), [`log`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/log_role), [`marquee`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/marquee_role), và [`status`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/status_role) vai trò `timer` là một live region và có thể được sửa đổi bởi các thuộc tính [live region](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions).

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) hoặc [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby)
  - : Một số trình đọc màn hình đọc tên của phần tử timer trước khi đọc nội dung của nó. Nếu tên hiển thị, hãy tham chiếu nó bằng `aria-labelledby`. Việc thêm `aria-label` cung cấp một cách để đặt phần văn bản đứng trước nội dung hiển thị của phần tử timer mà trình đọc màn hình đọc nhưng không hiển thị trên màn hình. Đặt tên cho timer không bắt buộc, vì vậy nếu không có gì phù hợp thì có thể bỏ qua cả hai thuộc tính này.

- [`aria-live`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-live)
  - : Các phần tử có vai trò `timer` có giá trị ngầm định của `aria-live` là `off`.

## Lưu ý về khả năng tiếp cận

Nếu cần đặt một giới hạn thời gian, ví dụ vì lý do bảo mật, người dùng nên có tùy chọn tắt nó hoặc kéo dài nó. Hạn chế này không áp dụng nếu giới hạn thời gian là do một sự kiện trực tiếp, chẳng hạn buổi đấu giá hoặc trò chơi, hoặc nếu thời gian hoàn thành form là thiết yếu cho một lần gửi hợp lệ.

## Ví dụ

### Timer cơ bản

Ví dụ này có một timer đếm ngược từ 30 giây xuống 0 giây. Toàn bộ vùng hiển thị thời gian có `role="timer"` và thêm [`aria-atomic`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-atomic) để chỉ ra rằng vùng đó nên được công bố như một tổng thể, không chỉ vùng đã thay đổi. Do `aria-live="off"` ngầm định, thay đổi không được thông báo theo mặc định; chúng ta tự đổi vai trò thành `"alert"` khi timer còn 10 giây để nó được thông báo một lần.

```html
<div id="countdown" role="timer" aria-atomic="true">
  <span id="number">30</span> seconds left!
</div>
```

```css
html {
  font-size: 50px;
  text-align: center;
  margin-top: 1em;
  font-family: sans-serif;
}

#number {
  font-family: monospace;
  color: #cc0000;
  font-weight: bold;
  font-size: 1.25em;
  vertical-align: middle;
}
```

```js
const numElement = document.getElementById("number");
const liveRegion = document.getElementById("countdown");
let startTime = new Date().getTime();

function decrement() {
  const timeNow = new Date().getTime();
  const elapsedTime = Math.floor((timeNow - startTime) / 1000);
  let newNumber = 30 - elapsedTime;

  if (newNumber >= 0) {
    numElement.textContent = newNumber;
  }

  if (newNumber === 10) {
    liveRegion.setAttribute("role", "alert");
    setTimeout(() => {
      liveRegion.setAttribute("role", "timer");
    }, 999);
  }
}

window.setInterval(() => {
  decrement();
}, 500);
```

## Đặc tả

{{Specifications}}

## Xem thêm

- [ARIA: vai trò `alert`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alert_role)
- [ARIA: vai trò `log`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/log_role)
- [ARIA: vai trò `marquee`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/marquee_role)
- [ARIA: vai trò `status`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/status_role)
- [ARIA live regions](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions)
