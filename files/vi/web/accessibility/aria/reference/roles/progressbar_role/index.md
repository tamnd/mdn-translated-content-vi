---
title: "ARIA: vai trò progressbar"
short-title: progressbar
slug: Web/Accessibility/ARIA/Reference/Roles/progressbar_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#progressbar
sidebar: accessibilitysidebar
---

Vai trò `progressbar` xác định một phần tử hiển thị trạng thái tiến trình cho các tác vụ mất nhiều thời gian.

## Mô tả

Widget range `progressbar` cho biết một yêu cầu đã được nhận và ứng dụng đang tiến gần tới việc hoàn tất hành động được yêu cầu.

Tác giả **có thể** đặt aria-valuemin và aria-valuemax để chỉ ra giá trị tối thiểu và tối đa của chỉ báo tiến trình. Nếu không, các giá trị ngầm định của chúng tuân theo cùng quy tắc như phần tử [`<input type="range">`](/en-US/docs/Web/HTML/Reference/Elements/input/range) của HTML:

- Nếu [`aria-valuemin`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemin) bị thiếu hoặc không phải là số, nó mặc định là `0`.
- Nếu [`aria-valuemax`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemax) bị thiếu hoặc không phải là số, nó mặc định là `100`.
- Các thuộc tính `aria-valuemin` và `aria-valuemax` chỉ cần được đặt cho vai trò `progressbar` khi giá trị tối thiểu của progress bar không phải là `0` hoặc giá trị tối đa không phải là `100`.
- Thuộc tính chỉ đọc [`aria-valuenow`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuenow) nên được cung cấp và cập nhật, trừ khi giá trị là `indeterminate`, trong trường hợp đó đừng bao gồm thuộc tính. Nếu được đặt, hãy bảo đảm giá trị `aria-valuenow` nằm giữa giá trị tối thiểu và tối đa.

Nếu vai trò `progressbar` được áp dụng cho phần tử HTML {{HTMLElement('progress')}}, tên khả năng tiếp cận có thể đến từ phần tử {{HTMLElement('label')}} liên kết. Nếu không, hãy dùng [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) nếu có nhãn hiển thị hoặc [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) nếu không có nhãn hiển thị.

### Tất cả phần tử con đều mang tính trình bày

Có một số loại thành phần giao diện người dùng, khi được biểu diễn trong một API khả năng tiếp cận của nền tảng, chỉ có thể chứa văn bản. Các API khả năng tiếp cận không có cách nào biểu diễn các phần tử ngữ nghĩa nằm trong `progressbar`. Để xử lý giới hạn này, trình duyệt tự động áp dụng vai trò [`presentation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role) cho mọi phần tử con của bất kỳ phần tử `progressbar` nào, vì đây là vai trò không hỗ trợ phần tử con mang ngữ nghĩa.

Ví dụ, hãy xem phần tử `progressbar` sau, có chứa một tiêu đề.

```html
<div role="progressbar"><h3>Title of my progressbar</h3></div>
```

Vì các phần tử con của `progressbar` mang tính trình bày, nên đoạn mã sau tương đương:

```html
<div role="progressbar">
  <h3 role="presentation">Title of my progressbar</h3>
</div>
```

Từ góc nhìn của người dùng công nghệ hỗ trợ, tiêu đề không tồn tại vì các đoạn mã trước đó tương đương với đoạn sau trong [cây khả năng tiếp cận](/en-US/docs/Glossary/Accessibility_tree):

```html
<div role="progressbar">Title of my progressbar</div>
```

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- [`aria-valuenow`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuenow)
  - : Chỉ có mặt và bắt buộc nếu giá trị không phải indeterminate. Đặt thành một giá trị thập phân nằm giữa `0`, hoặc `aria-valuemin` nếu có, và `aria-valuemax` để chỉ ra giá trị hiện tại của progress bar.
- [`aria-valuetext`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuetext)
  - : Công nghệ hỗ trợ thường trình bày giá trị của `aria-valuenow` dưới dạng phần trăm. Nếu điều đó không chính xác, hãy dùng thuộc tính này để làm giá trị progress bar dễ hiểu hơn.
- [`aria-valuemin`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemin)
  - : Đặt thành một giá trị thập phân đại diện cho giá trị tối thiểu, và nhỏ hơn `aria-valuemax`. Nếu không có, giá trị mặc định là `0`.
- [`aria-valuemax`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemax)
  - : Đặt thành một giá trị thập phân đại diện cho giá trị tối đa, và lớn hơn `aria-valuemin`. Nếu không có, giá trị mặc định là `100`.
- [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) hoặc [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby)
  - : Xác định giá trị chuỗi hoặc nhận diện phần tử (hoặc các phần tử) gắn nhãn cho phần tử progressbar, cung cấp một tên khả năng tiếp cận. Tên khả năng tiếp cận là bắt buộc.

Nên dùng phần tử {{HTMLElement("progress")}} gốc hoặc các phần tử [`<input type="range">`](/en-US/docs/Web/HTML/Reference/Elements/input/range) thay vì vai trò `progressbar`. User agent cung cấp một widget được tạo kiểu cho phần tử {{HTMLElement("progress")}} dựa trên `value` hiện tại so với `0`, giá trị tối thiểu và giá trị `max`. Khi dùng phần tử không ngữ nghĩa, mọi tính năng của phần tử ngữ nghĩa gốc đều cần được tái tạo bằng các thuộc tính ARIA, JavaScript và CSS.

## Ví dụ

Trong ví dụ dưới đây, progress bar dùng giá trị mặc định 0 và 100 cho `aria-valuemin` và `aria-valuemax`:

```html
<div>
  <span id="loadinglabel">Loading:</span>
  <span role="progressbar" aria-labelledby="loadinglabel" aria-valuenow="23">
    <svg width="100" height="10">
      <rect height="10" width="100" stroke="black" fill="black" />
      <rect height="10" width="23" fill="white" />
    </svg>
  </span>
</div>
```

Nếu dùng HTML ngữ nghĩa, có thể viết như sau:

```html
<label for="loadinglabel">Loading:</label>
<progress id="loadinglabel" max="100" value="23"></progress>
```

## Thực hành tốt nhất

Nếu progress bar mô tả tiến trình tải của một vùng cụ thể trên trang, hãy bao gồm thuộc tính [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby) để tham chiếu đến trạng thái của progress bar, và đặt thuộc tính [`aria-busy`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-busy) thành `true` trên vùng đó cho tới khi tải xong.

### Ưu tiên HTML

Nên dùng phần tử {{HTMLElement("progress")}} gốc hoặc phần tử [`<input type="range">`](/en-US/docs/Web/HTML/Reference/Elements/input/range) thay vì vai trò `progressbar`.

## Đặc tả

{{Specifications}}

## Xem thêm

- Phần tử HTML {{HTMLElement('progress')}}
- Các widget range khác gồm:
  - [`meter`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/meter_role)
  - [`scrollbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/scrollbar_role)
  - [`separator`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/separator_role) (nếu có thể nhận focus)
  - [`slider`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/slider_role)
  - [`spinbutton`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/spinbutton_role)
