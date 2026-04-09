---
title: "ARIA: thuộc tính aria-sort"
short-title: aria-sort
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-sort
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-sort
sidebar: accessibilitysidebar
---

Thuộc tính `aria-sort` cho biết các mục trong một bảng hoặc grid đang được sắp xếp theo thứ tự tăng dần hay giảm dần.

## Mô tả

Nếu grid hoặc bảng cung cấp chức năng sắp xếp, thuộc tính `aria-sort` nên được đặt thành `ascending` hoặc `descending` (hoặc `other`) trên ô tiêu đề của cột hoặc hàng đang được sắp xếp.

Thuộc tính `aria-sort` chỉ được đặt trên cột hoặc hàng hiện đang được sắp xếp. Đặt `aria-sort="ascending"` để cho biết các ô dữ liệu trong cột hoặc hàng được sắp xếp theo thứ tự tăng dần. Nếu thứ tự sắp xếp bị đảo ngược, hãy đổi giá trị thành `aria-sort="descending"`. Khi một cột hoặc hàng khác trở thành được sắp xếp, thuộc tính `aria-sort` đơn lẻ sẽ được chuyển sang ô tiêu đề của cột hoặc hàng mới với giá trị phù hợp cho thứ tự sắp xếp.

Thuộc tính `aria-sort` chỉ nên được thêm vào một tiêu đề bảng hoặc grid tại một thời điểm. Thuộc tính này được đặt để cho người dùng công nghệ hỗ trợ biết cột hoặc hàng nào đang được sắp xếp. Nó không ảnh hưởng đến thứ tự sắp xếp thực tế.

## Ví dụ

Bảng này được tải với cột họ đã được sắp xếp theo thứ tự tăng dần.

```html
<table>
  <caption>
    Steering Committee Members
  </caption>
  <thead>
    <tr>
      <th>
        <button>First Name</button>
      </th>
      <th aria-sort="ascending">
        <button>Last Name</button>
      </th>
      <th>
        <button>Company</button>
      </th>
      <th>Email</th>
    </tr>
  </thead>
  <tbody>
    …
  </tbody>
</table>
```

Nếu người dùng nhấp vào nút _Last Name_, [`aria-pressed="true"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-pressed) sẽ được thêm vào phần tử {{HTMLElement('button')}} và giá trị `aria-sort` sẽ được chuyển sang `"descending"` bằng JavaScript. Nếu người dùng nhấp vào một nút tiêu đề khác, `aria-sort` sẽ bị gỡ khỏi tiêu đề _Last Name_ và được đặt lên phần tử cha {{HTMLElement('th')}} của nút vừa được nhấp.

Chúng tôi đã cung cấp hướng dẫn trong caption cho công nghệ hỗ trợ, vì có thể chúng không nhìn thấy các mũi tên xuống mà chúng ta sẽ thêm bằng CSS nhắm đến các bộ chọn `th[aria-sort="ascending"]` và `th[aria-sort="descending"]`.

## Giá trị

- `ascending`
  - : Các mục được sắp xếp theo thứ tự tăng dần bởi cột này.
- `descending`
  - : Các mục được sắp xếp theo thứ tự giảm dần bởi cột này.
- `none` (mặc định)
  - : Không có thứ tự sắp xếp nào được áp dụng cho cột.
- `other`
  - : Một thuật toán sắp xếp khác với tăng dần hoặc giảm dần đã được áp dụng.

## Giao diện liên quan

- {{domxref("Element.ariaSort")}}
  - : Thuộc tính [`ariaSort`](/en-US/docs/Web/API/Element/ariaSort), thuộc giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-sort`.
- {{domxref("ElementInternals.ariaSort")}}
  - : Thuộc tính [`ariaSort`](/en-US/docs/Web/API/ElementInternals/ariaSort), thuộc giao diện {{domxref("ElementInternals")}}, phản ánh giá trị của thuộc tính `aria-sort`.

## Vai trò liên quan

Được dùng trong các vai trò:

- [`columnheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role)
- [`rowheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowheader_role)

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [Sortable table example](https://www.w3.org/WAI/ARIA/apg/patterns/table/examples/sortable-table/) - ARIA Authoring Practices Guide (APG)
- [`aria-pressed`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-pressed)
- Phần tử {{HTMLElement('th')}}
