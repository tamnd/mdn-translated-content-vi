---
title: Thuộc tính toàn cục HTML accesskey
short-title: accesskey
slug: Web/HTML/Reference/Global_attributes/accesskey
page-type: html-attribute
browser-compat: html.global_attributes.accesskey
sidebar: htmlsidebar
---

Thuộc tính toàn cục **`accesskey`** [global attribute](/en-US/docs/Web/HTML/Reference/Global_attributes) cung cấp gợi ý để tạo phím tắt bàn phím cho phần tử hiện tại. Giá trị thuộc tính phải bao gồm một ký tự có thể in được (bao gồm các ký tự có dấu và các ký tự khác có thể được tạo ra bởi bàn phím).

{{InteractiveExample("HTML Demo: accesskey", "tabbed-shorter")}}

```html interactive-example
<p>If you need to relax, press the <b>S</b>tress reliever!</p>
<button accesskey="s">Stress reliever</button>
```

```css interactive-example
b {
  text-decoration: underline;
}
```

Cách kích hoạt accesskey phụ thuộc vào trình duyệt và nền tảng của nó:

<table class="standard-table">
  <tbody>
    <tr>
      <th></th>
      <th>Windows</th>
      <th>Linux</th>
      <th>Mac</th>
    </tr>
    <tr>
      <th>Firefox</th>
      <td colspan="2"><kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd><em>key</em></kbd></td>
      <td>
        <kbd>Control</kbd> + <kbd>Option</kbd> +
        <kbd><em>key</em></kbd> hoặc <kbd>Control</kbd> + <kbd>Alt</kbd> +
        <kbd><em>key</em></kbd>
      </td>
    </tr>
    <tr>
      <th>MS Edge</th>
      <td rowspan="2"><kbd>Alt</kbd> + <kbd><em>key</em></kbd></td>
      <td rowspan="2">
        <kbd>Control</kbd> + <kbd>Option</kbd> + <kbd><em>key</em></kbd><br>hoặc <kbd>Control</kbd> + <kbd>Option</kbd> + <kbd>Shift</kbd> +
        <kbd><em>key</em></kbd>
      </td>
      <td rowspan="2"><kbd>Control</kbd> + <kbd>Option</kbd> + <kbd><em>key</em></kbd></td>
    </tr>
    <tr>
      <th>Google Chrome</th>
    </tr>
    <tr>
      <th>Safari</th>
      <td colspan="2">không áp dụng</td>
      <td><kbd>Control</kbd> + <kbd>Option</kbd> + <kbd><em>key</em></kbd></td>
    </tr>
    <tr>
      <th>Opera</th>
      <td colspan="2"><kbd>Alt</kbd> + <kbd><em>key</em></kbd></td>
      <td><kbd>Control</kbd> + <kbd>Alt</kbd> + <kbd><em>key</em></kbd></td>
    </tr>
  </tbody>
</table>

## Vấn đề trợ năng

Có nhiều vấn đề với thuộc tính `accesskey`:

- Giá trị `accesskey` có thể xung đột với phím tắt hệ thống hoặc trình duyệt, hoặc chức năng công nghệ hỗ trợ. Những gì có thể hoạt động cho một tổ hợp hệ điều hành, công nghệ hỗ trợ và trình duyệt có thể không hoạt động với các tổ hợp khác.
- Một số giá trị `accesskey` nhất định có thể không có trên một số bàn phím nhất định, đặc biệt khi quốc tế hóa là mối quan tâm. Vì vậy việc thích nghi với các ngôn ngữ cụ thể có thể gây ra thêm vấn đề.
- Các giá trị `accesskey` dựa trên số có thể gây nhầm lẫn cho những người gặp phải các vấn đề về nhận thức, trong đó số không có liên kết logic với chức năng mà nó kích hoạt.
- Thông báo cho người dùng rằng `accesskey` đang có mặt, để họ biết về chức năng. Nếu hệ thống thiếu phương pháp thông báo cho người dùng về tính năng này, người dùng có thể vô tình kích hoạt `accesskey`.

Do những vấn đề này, nhìn chung không nên dùng `accesskey` cho hầu hết các trang web và ứng dụng web đa năng.

- [WebAIM: Keyboard Accessibility - Accesskey](https://webaim.org/techniques/keyboard/accesskey#spec)

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLElement.accessKey")}}
- {{domxref("HTMLElement.accessKeyLabel")}}
- Tất cả [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).
- [`aria-keyshortcuts`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-keyshortcuts)
