---
title: "ARIA: thuộc tính aria-current"
short-title: aria-current
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-current
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-current
sidebar: accessibilitysidebar
---

Trạng thái `aria-current` khác rỗng trên một phần tử cho biết phần tử đó đại diện cho mục hiện tại trong một vùng chứa hoặc một tập các phần tử liên quan.

## Mô tả

Khi bạn có một nhóm các phần tử liên quan, chẳng hạn vài liên kết trong breadcrumb hoặc các bước trong một luồng nhiều bước, với một phần tử trong nhóm được tạo kiểu khác các phần tử còn lại để báo cho người dùng nhìn thấy rằng đây là phần tử hiện tại trong nhóm của nó, thì nên dùng `aria-current` để cho người dùng công nghệ hỗ trợ biết điều đã được thể hiện bằng kiểu dáng.

Trong danh sách breadcrumb, khi một liên kết trong tập các liên kết phân trang được tạo kiểu để cho biết người dùng hiện đang ở trang đó, hãy đặt `aria-current="page"` trên liên kết đó. Trong một quy trình nhiều bước với chỉ báo bước, chẳng hạn khảo sát nhiều trang hoặc quy trình thanh toán/đăng ký nhiều bước, khi biểu tượng của bước hiện tại được hiển thị khác đi để biểu thị đó là bước hiện tại, vùng chứa của biểu tượng đó nên có `aria-current="step"` cho những người dùng công nghệ hỗ trợ không thể "thấy" sự khác biệt trực quan.

Thuộc tính `aria-current` cho biết phần tử mà nó được đặt lên, với giá trị khác `false`, đại diện cho mục hiện tại trong một vùng chứa hoặc một tập phần tử liên quan. Chỉ đánh dấu một phần tử trong một tập là hiện tại với `aria-current`.

Thuộc tính `aria-current` chấp nhận một danh sách giá trị hạn chế bao gồm `page`, `step`, `location`, `date`, `time`, `true`, và `false`. Bất kỳ giá trị chuỗi không rỗng nào không nằm trong danh sách các giá trị liệt kê này sẽ được xử lý như thể `aria-current="true"` đã được đặt, chứ không phải giá trị mặc định `false`. Nếu thuộc tính không có mặt, là chuỗi rỗng, có mặt nhưng không có giá trị, hoặc được đặt thành `aria-current="false"` thì nó sẽ không được hiển thị cho người dùng.

Khi một thứ được chọn thay vì là hiện tại, chẳng hạn một [`tab`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role) trong một [`tablist`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tablist_role), hãy dùng [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected) để chỉ ra tabpanel đang được hiển thị.

> [!NOTE]
> Không dùng `aria-current` thay cho [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected) trong [`gridcell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role), [`option`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/option_role), [`row`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role) hoặc [`tab`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role).

## Ví dụ

Breadcrumb cho "trang hiện tại" nên có `aria-current="page"` được đặt trên nó.

```html
<nav aria-label="Breadcrumb" class="breadcrumb">
  <ol>
    <li>
      <a href="../../../../../">Công nghệ web cho nhà phát triển</a>
    </li>
    <li>
      <a href="../../../../">Trợ năng</a>
    </li>
    <li>
      <a href="../../../">ARIA</a>
    </li>
    <li>
      <a href="../../">Trạng thái và thuộc tính ARIA</a>
    </li>
    <li>
      <a href="./" aria-current="page">ARIA: thuộc tính `aria-current`</a>
    </li>
  </ol>
</nav>
```

Nếu phần tử đại diện cho trang hiện tại trong breadcrumb không phải là một liên kết, `aria-current` là tùy chọn.

## Giá trị

- `page`
  - : Đại diện cho trang hiện tại trong một tập các trang, chẳng hạn liên kết tới tài liệu hiện tại trong breadcrumb.
- `step`
  - : Đại diện cho bước hiện tại trong một quy trình, chẳng hạn bước hiện tại trong luồng thanh toán nhiều bước.
- `location`
  - : Đại diện cho vị trí hiện tại trong một môi trường hoặc ngữ cảnh, chẳng hạn hình ảnh được làm nổi bật trực quan như thành phần hiện tại của một sơ đồ luồng.
- `date`
  - : Đại diện cho ngày hiện tại trong một tập hợp các ngày, chẳng hạn ngày hiện tại trong lịch.
- `time`
  - : Đại diện cho thời gian hiện tại trong một tập hợp các mốc thời gian, chẳng hạn thời gian hiện tại trong bảng lịch trình.
- `true`
  - : Đại diện cho mục hiện tại trong một tập.
- `false` (mặc định)
  - : Không đại diện cho mục hiện tại trong một tập.

## Giao diện liên quan

- {{domxref("Element.ariaCurrent")}}
  - : Thuộc tính [`ariaCurrent`](/en-US/docs/Web/API/Element/ariaCurrent), là một phần của giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-current`.
- {{domxref("ElementInternals.ariaCurrent")}}
  - : Thuộc tính [`ariaCurrent`](/en-US/docs/Web/API/ElementInternals/ariaCurrent) của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính `aria-current`.

## Vai trò liên quan

Có thể dùng trong mọi vai trò; ngoại trừ các phần tử có vai trò [`gridcell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role), [`option`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/option_role), [`row`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role) và [`tab`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role), nơi nên dùng [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected)

## Đặc tả

{{Specifications}}

## Xem thêm

- [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected)
- {{cssxref(':local-link')}}
- [Điều hướng breadcrumb với `aria-current`](/en-US/docs/Web/CSS/How_to/Layout_cookbook/Breadcrumb_navigation)
