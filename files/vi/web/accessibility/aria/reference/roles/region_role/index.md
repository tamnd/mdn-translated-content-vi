---
title: "ARIA: vai trò region"
short-title: region
slug: Web/Accessibility/ARIA/Reference/Roles/region_role
page-type: aria-role
spec-urls:
  - https://w3c.github.io/aria/#region
  - https://www.w3.org/WAI/ARIA/apg/patterns/landmarks/examples/region.html
sidebar: accessibilitysidebar
---

**Vai trò `region`** được dùng để xác định các khu vực của tài liệu mà tác giả cho là quan trọng. Đây là một landmark tổng quát có sẵn để hỗ trợ điều hướng khi không có vai trò landmark nào khác phù hợp.

```html
<div role="region" aria-label="Example">
  <!-- region content -->
</div>
```

## Mô tả

Vai trò `region` là một vai trò [landmark ARIA](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles#3._landmark_roles).
Vai trò `region` nên được dành cho những phần nội dung đủ quan trọng để người dùng có khả năng muốn điều hướng tới phần đó một cách dễ dàng và để nó được liệt kê trong bản tóm tắt của trang. `region` là một thuật ngữ tổng quát hơn, và chỉ nên được dùng nếu phần cần nhận diện không được mô tả chính xác bởi một trong các vai trò landmark khác, chẳng hạn như [`banner`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/banner_role), [`main`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/main_role), [`contentinfo`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/contentinfo_role), [`complementary`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/complementary_role), hoặc [`navigation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/navigation_role).

Mọi phần tử có vai trò `region` nên bao gồm một nhãn mô tả mục đích của nội dung trong vùng đó, tốt nhất là bằng [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) tham chiếu tới một tiêu đề hiển thị. Nếu không có tiêu đề hiển thị phù hợp, nên dùng [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label).

Nội dung của landmark `region` nên vẫn có ý nghĩa nếu được tách khỏi nội dung chính của tài liệu.

Dùng phần tử {{HTMLElement('section')}} sẽ tự động truyền đạt rằng một section có vai trò `region` nếu nó được đặt tên có thể truy cập. Nhà phát triển nên luôn ưu tiên dùng phần tử HTML ngữ nghĩa đúng, trong trường hợp này là `<section>`, thay vì dùng ARIA.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) hoặc [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label)
  - : Dùng thuộc tính này để gắn nhãn cho vùng. Thường thì giá trị của thuộc tính `aria-labelledby` sẽ là `id` của phần tử dùng để đặt tiêu đề cho section. Nếu không có tiêu đề hiển thị phù hợp, nên dùng `aria-label`.

## Ví dụ

```html
<div role="region" aria-labelledby="region-heading">
  <h2 id="region-heading">
    This heading's `id` attribute helps this region have an accessible name
  </h2>
  <!-- region content -->
</div>
```

## Lưu ý về khả năng tiếp cận

Dùng một cách tiết chế! Các vai trò [landmark](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles#3._landmark_roles) chỉ nên được dùng một cách tiết kiệm, để xác định các phần tổng thể lớn hơn của tài liệu. Dùng quá nhiều vai trò landmark có thể tạo ra "nhiễu" trong trình đọc màn hình, khiến khó hiểu bố cục tổng thể của trang.

Chỉ dùng vai trò `region` nếu không có phần tử [content sectioning](/en-US/docs/Web/HTML/Reference/Elements#content_sectioning) hoặc [landmark role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles#3._landmark_roles) nào khác phù hợp. Nếu có nhiều vùng trên một trang, có thể cần xem xét lại cấu trúc tổng thể của trang.

## Thực hành tốt nhất

### Ưu tiên HTML

Dùng phần tử {{HTMLElement('section')}} sẽ tự động truyền đạt rằng phần tử có vai trò `region`. Nếu có thể, hãy ưu tiên dùng phần tử `<section>` ngữ nghĩa thay vì vai trò `region`.

### Gắn nhãn landmark

Nếu có nhiều hơn một vai trò landmark `region` trong một tài liệu, hãy cung cấp một nhãn duy nhất cho mỗi vùng. Nhãn này sẽ giúp người dùng công nghệ hỗ trợ nhanh chóng hiểu mục đích của từng landmark.

```html
<div role="region" aria-labelledby="use-discretion">
  <h3 id="use-discretion">Please use the `region` role with discretion</h3>
  <!-- content -->
</div>

…

<div role="region" aria-labelledby="please-reconsider">
  <h3 id="please-reconsider">Please reconsider your document structure</h3>
  <!-- content -->
</div>
```

Trong ví dụ này, nhãn của vùng được tạo từ thuộc tính [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby).

### Khu vực nội dung có thể cuộn với văn bản tràn

Nếu có một khu vực nội dung với `tabindex="0"`, hãy thêm `role="region"` để truyền đạt cho người dùng trình đọc màn hình rằng đó là một vùng tổng quát. Điều này được làm để cho phép người dùng chỉ dùng bàn phím có thể cuộn các vùng có văn bản tràn.

### SVG

`role="region"` có thể được khai báo trên các vùng của {{SVGElement('svg')}} cùng với `aria-label` để cho phép mô tả từng phần của SVG.

## Đặc tả

{{Specifications}}

## Xem thêm

- Phần tử {{HTMLElement('section')}}
- [ARIA: vai trò `banner`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/banner_role)
- [ARIA: vai trò `main`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/main_role)
- [ARIA: vai trò `contentinfo`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/contentinfo_role)
- [ARIA: vai trò `complementary`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/complementary_role)
- [ARIA: vai trò `navigation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/navigation_role)
- [Landmark roles: Using ARIA: Roles, States, and Properties](/en-US/docs/Web/Accessibility/ARIA/Guides/Techniques#landmark_roles)
- [Accessible Landmarks | scottohara.me](https://www.scottohara.me/blog/2018/03/03/landmarks.html)
