---
title: "ARIA: vai trò presentation"
short-title: presentation
slug: Web/Accessibility/ARIA/Reference/Roles/presentation_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#presentation
sidebar: accessibilitysidebar
---

Vai trò `presentation` và từ đồng nghĩa của nó là `none` loại bỏ ngữ nghĩa ARIA ngầm định của một phần tử khỏi việc được hiển thị trong cây khả năng tiếp cận.

Nội dung của phần tử vẫn sẽ có sẵn cho công nghệ hỗ trợ; chỉ có ngữ nghĩa của vùng chứa - và trong một số trường hợp, các phần tử con liên quan bắt buộc - sẽ không còn hiển thị ánh xạ của chúng lên accessibility API nữa.

## Mô tả

Trong khi ARIA chủ yếu được dùng để diễn đạt ngữ nghĩa, có một số tình huống việc ẩn ngữ nghĩa của một phần tử khỏi công nghệ hỗ trợ là hữu ích. Điều này được thực hiện bằng vai trò `presentation` hoặc vai trò đồng nghĩa `none`, vốn khai báo rằng một phần tử chỉ được dùng cho trình bày và vì vậy không có ngữ nghĩa khả năng tiếp cận.

Việc viết `<h2 role="presentation">Democracy Dies in Darkness</h2>` loại bỏ ngữ nghĩa tiêu đề của phần tử {{HTMLElement("Heading_Elements", "h2")}}, khiến nó tương đương với `<div>Democracy Dies in Darkness</div>`. Ngữ nghĩa vai trò tiêu đề bị loại bỏ, nhưng chính nội dung vẫn còn có sẵn.

Khi một phần tử có các phần tử con bắt buộc, chẳng hạn như các phần tử {{HTMLElement('table')}} khác nhau, và các phần tử con {{HTMLElement('li')}} của một {{HTMLElement('ul')}} hoặc {{HTMLElement('ol')}}, vai trò `presentation` hoặc `none` trên bảng hay danh sách sẽ loại bỏ ngữ nghĩa mặc định của phần tử mà nó được áp dụng và các phần tử con bắt buộc của nó.

Nếu `presentation` hoặc `none` được áp dụng cho một phần tử {{HTMLElement('table')}}, các phần tử con {{HTMLElement('caption')}}, {{HTMLElement('thead')}}, {{HTMLElement('tbody')}}, {{HTMLElement('tfoot')}}, {{HTMLElement('tr')}}, {{HTMLElement('th')}}, và {{HTMLElement('td')}} sẽ kế thừa vai trò đó và do đó không được hiển thị cho công nghệ hỗ trợ. Tuy nhiên, các phần tử bên trong phần tử {{HTMLElement('th')}} và {{HTMLElement('td')}}, bao gồm cả các bảng lồng nhau, vẫn được hiển thị cho công nghệ hỗ trợ.

```html
<ul role="presentation">
  <li>
    <a href="#">Link 1</a>
  </li>
  <li>
    <a href="#">Link 2</a>
  </li>
  <li>
    <a href="#">Link 3</a>
  </li>
</ul>
```

Vì vai trò `presentation` được áp dụng cho phần tử {{HTMLElement('ul')}}, mọi phần tử {{HTMLElement('li')}} con đều kế thừa vai trò `presentation`. Điều này là do ARIA yêu cầu các phần tử `listitem` phải có một phần tử cha `list`. Trong trường hợp này, dù các phần tử {{HTMLElement('li')}} không được hiển thị cho công nghệ hỗ trợ, các phần tử con của những phần tử bắt buộc đó vẫn được hiển thị. Nếu chúng ta đã lồng một danh sách bên trong một trong những phần tử {{HTMLElement('li')}} đó, nó sẽ vẫn hiển thị cho công nghệ hỗ trợ. Với những phần tử không có phần tử con bắt buộc, mọi phần tử lồng bên trong phần tử có `role="presentation"` hoặc `role="none"` sẽ giữ nguyên ngữ nghĩa của chúng. Trong trường hợp này, các phần tử {{HTMLElement('a')}} nằm bên trong những phần tử {{HTMLElement('li')}} đó vẫn được hiển thị.

Phần tử {{HTMLElement('a')}} là một trường hợp đặc biệt. Vai trò của nó vẫn sẽ được hiển thị ngay cả khi `presentation` hoặc `none` được áp dụng trực tiếp cho nó. Trình duyệt bỏ qua `role="presentation"` và `role="none"` trên các phần tử có thể nhận focus, bao gồm liên kết và input, hoặc bất kỳ thứ gì có thuộc tính [tabindex](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex) được đặt. Trình duyệt cũng bỏ qua việc đưa vai trò này vào nếu phần tử có bất kỳ trạng thái và thuộc tính ARIA toàn cục nào, chẳng hạn như [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby).

> [!NOTE]
> Phần tử có `role="presentation"` không nằm trong cây khả năng tiếp cận và không nên có tên khả năng tiếp cận. Không **được** dùng [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) hoặc [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label).

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

Không có. Nếu một trạng thái và thuộc tính ARIA toàn cục được đặt, `presentation` hoặc `none` sẽ bị bỏ qua, và vai trò ngầm định của phần tử sẽ được dùng.

## Ví dụ

```html
<hr role="none" />
```

## Đặc tả

{{Specifications}}

## Xem thêm

- [`aria-hidden`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-hidden) so với [`role="presentation/none"`](https://www.scottohara.me/blog/2018/05/05/hidden-vs-none.html) - bởi Scott O'Hara
