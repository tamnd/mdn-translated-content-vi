---
title: "ARIA: thuộc tính aria-controls"
short-title: aria-controls
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-controls
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-controls
sidebar: accessibilitysidebar
---

Thuộc tính toàn cục `aria-controls` xác định phần tử (hoặc các phần tử) mà nội dung hoặc sự hiện diện của chúng được phần tử đặt thuộc tính này điều khiển.

## Mô tả

Khi một widget hoặc phần tử tương tác, dù là combobox, tab, button, v.v., được dùng để điều chỉnh hoặc sửa đổi một phần tử hay thành phần khác trong tài liệu hoặc ứng dụng, thuộc tính `aria-controls` có thể được dùng để liên kết theo chương trình phần tử tương ứng với phần tử điều khiển. Thuộc tính `aria-controls` xác định phần tử (hoặc các phần tử) mà nội dung hoặc sự hiện diện của chúng được phần tử đặt thuộc tính này điều khiển, bất kể kiểu tương tác nào khởi tạo hành vi bị ảnh hưởng.

Một phần tử [combobox](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role) có `aria-controls` được đặt bằng một giá trị tham chiếu tới phần tử đóng vai trò là popup. `aria-controls` chỉ cần được đặt khi popup hiển thị, nhưng cũng hợp lệ và dễ lập trình hơn nếu tham chiếu đến một phần tử không hiển thị.

Các ví dụ khác về điều khiển bao gồm:

- Phần nút của widget accordion dùng để bật hoặc tắt khả năng hiển thị nội dung panel liên kết của chúng. Mỗi nút có thể có `aria-controls` chỉ định, tham chiếu đến `id` của phần tử chứa nội dung liên kết với control đã gọi.
- Một phần tử có vai trò [`scrollbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/scrollbar_role): thanh cuộn cần có thuộc tính `aria-controls` tham chiếu đến `id` của phần tử mà nó điều khiển.
- Một nhóm tab mà mỗi tab hiển thị một tab panel khác nhau: mỗi phần tử có [`role="tab"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role) có thuộc tính `aria-controls` tham chiếu tới [`tabpanel`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tabpanel_role) tương ứng.

## Ví dụ

Trong ví dụ tabs này, mỗi tab điều khiển một tabpanel:

```html
<div class="tab-interface">
  <div role="tablist" aria-label="Các tab mẫu">
    <span
      role="tab"
      aria-selected="true"
      aria-controls="panel-1"
      id="tab-1"
      tabindex="0">
      Tab thứ nhất
    </span>
    <span
      role="tab"
      aria-selected="false"
      aria-controls="panel-2"
      id="tab-2"
      tabindex="-1">
      Tab thứ hai
    </span>
    <span
      role="tab"
      aria-selected="false"
      aria-controls="panel-3"
      id="tab-3"
      tabindex="-1">
      Tab thứ ba
    </span>
  </div>
  <div id="panel-1" role="tabpanel" tabindex="0" aria-labelledby="tab-1">
    <p>Nội dung của panel thứ nhất</p>
  </div>
  <div
    id="panel-2"
    role="tabpanel"
    tabindex="0"
    aria-labelledby="tab-2"
    class="display-none">
    <p>Nội dung của panel thứ hai</p>
  </div>
  <div
    id="panel-3"
    role="tabpanel"
    tabindex="0"
    aria-labelledby="tab-3"
    class="display-none">
    <p>Nội dung của panel thứ ba</p>
  </div>
</div>
```

> [!NOTE]
> ARIA chỉ sửa đổi cây khả năng tiếp cận của một phần tử, xác định cách công nghệ hỗ trợ có thể trình bày nội dung cho người dùng. ARIA không thay đổi bất kỳ chức năng ngầm định hay kiểu dáng nào.

## Giá trị

- `id` list
  - : Danh sách một hoặc nhiều giá trị ID được phân tách bằng khoảng trắng, tham chiếu đến các phần tử đang được phần tử hiện tại điều khiển

## Giao diện liên quan

- {{domxref("Element.ariaControlsElements")}}
  - : Thuộc tính `ariaControlsElements` là một phần của giao diện của mỗi phần tử.
    Giá trị của nó là một mảng các thể hiện của các lớp con của {{domxref("Element")}} phản ánh các tham chiếu `id` trong thuộc tính `aria-controls` ([với một số lưu ý](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references)).
- {{domxref("ElementInternals.ariaControlsElements")}}
  - : Thuộc tính `ariaControlsElements` là một phần của giao diện của mỗi phần tử tùy chỉnh.
    Giá trị của nó là một mảng các thể hiện của các lớp con của {{domxref("Element")}} phản ánh các tham chiếu `id` trong thuộc tính `aria-controls` ([với một số lưu ý](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references)).

## Vai trò liên quan

Được dùng trong **TẤT CẢ** vai trò.

## Đặc tả

{{Specifications}}

## Xem thêm

- [`aria-owns`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-owns)
