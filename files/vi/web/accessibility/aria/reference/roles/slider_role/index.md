---
title: "ARIA: vai trò slider"
short-title: slider
slug: Web/Accessibility/ARIA/Reference/Roles/slider_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#slider
sidebar: accessibilitysidebar
---

Vai trò `slider` định nghĩa một đầu vào nơi người dùng chọn một giá trị trong một khoảng cho trước.

## Mô tả

Vai trò `slider` dành cho các widget đầu vào theo khoảng, nơi người dùng chọn một giá trị từ các giá trị tối thiểu và tối đa đã cho.

### Vai trò `slider` so với các tùy chọn range khác

ARIA cung cấp cho nhà phát triển sáu vai trò widget range khác nhau, bao gồm `progressbar`, `meter`, và `slider`.

Vai trò [`progressbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/progressbar_role), tương tự phần tử {{HTMLElement('progress')}} của HTML, là một range chỉ đọc biểu thị phần tiến độ hoàn thành của một tác vụ, tiến về một hướng duy nhất, như thanh tiến trình tải tệp sẽ cuối cùng đạt 100% khi tải xong.

Vai trò [`meter`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/meter_role), tương tự phần tử {{HTMLElement('meter')}} của HTML, là một đồng hồ đo chỉ đọc biểu thị lượng của một thứ gì đó trong một khoảng đã biết, như chỉ báo pin của máy tính hoặc đồng hồ xăng của ô tô.

Vai trò `slider`, tương tự phần tử `input` kiểu `range` của HTML, [`<input type="range">`](/en-US/docs/Web/HTML/Reference/Elements/input/range), là một range đầu vào đọc-ghi. Slider cho phép người dùng chọn một giá trị giữa các giá trị tối thiểu và tối đa đã đặt. Người dùng chọn giá trị bằng cách di chuyển thumb của slider dọc theo một slider ngang hoặc dọc để chọn giá trị.

Mặc dù cả ba loại range này có cùng các trạng thái và thuộc tính ARIA, vai trò `slider` là range duy nhất đọc-ghi: nó là loại duy nhất mà giá trị thay đổi qua tương tác người dùng. Vì vậy, nó phải có khả năng nhận focus. Ngoài ra, phải hỗ trợ tương tác bàn phím, nhấp chuột và cảm ứng.

> [!WARNING]
> Để thay đổi giá trị slider, các công nghệ hỗ trợ dựa trên cảm ứng cần phản hồi các cử chỉ của người dùng để tăng và giảm giá trị bằng cách tạo ra các sự kiện phím tổng hợp.
> Hãy kiểm thử đầy đủ các widget slider bằng công nghệ hỗ trợ trên các thiết bị mà cảm ứng là cơ chế nhập liệu chính trước khi dùng vai trò `slider` (và mọi widget range).

### Các thuộc tính thường dùng

Thuộc tính [`aria-valuemin`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemin) đặt giá trị tối thiểu. Nếu bỏ qua hoặc không phải số, nó mặc định là `0` (không).

Thuộc tính [`aria-valuemax`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemax) xác định giá trị tối đa. Nếu thiếu hoặc không phải số, nó mặc định là 100.

Giá trị thuộc tính [`aria-valuenow`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuenow) phải nằm giữa giá trị tối thiểu và tối đa, bao gồm cả hai đầu. Thuộc tính này là bắt buộc với `slider` và `meter`, và tùy chọn với `progressbar`.

Với `slider`, trừ khi dùng phần tử [`<input type="range">`](/en-US/docs/Web/HTML/Reference/Elements/input/range), giá trị `aria-valuenow` phải được cập nhật theo chương trình khi người dùng cập nhật giá trị.

Thuộc tính tùy chọn [`aria-valuetext`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuetext) được thêm khi giá trị số `aria-valuenow` không phản ánh giá trị dự định của slider. Vì giá trị tối thiểu, tối đa và hiện tại đều là số, khi những số đó biểu diễn các giá trị không phải số, thuộc tính `aria-valuetext` nên được thêm với một chuỗi xác định giá trị số đó. Ví dụ, nếu dùng slider cho cỡ áo thun, thuộc tính `aria-valuetext` nên thay đổi từ xx-small đến XX-large khi `aria-valuenow` tăng lên.

Giá trị `aria-valuetext` phải được cập nhật khi `value` hoặc `aria-valuenow` được cập nhật. Mặc dù không có thuộc tính HTML tương đương cho `<input type="range">`, bạn có thể thêm `aria-valuetext` vào bất kỳ kiểu {{htmlelement('input')}} nào. Thuộc tính ARIA được hỗ trợ trên các phần tử HTML ngữ nghĩa.

Khi `aria-valuetext` là một tính năng quan trọng với slider, hãy cân nhắc dùng {{HTMLElement('select')}} cùng các phần tử {{HTMLElement('option')}} thay vào đó. Mặc dù không phải là range theo nghĩa trực quan, giá trị của mỗi option sẽ dễ tiếp cận hơn cho tất cả người dùng, không chỉ người dùng công nghệ hỗ trợ.

Tên truy cập được là **bắt buộc**. Nếu vai trò range được áp dụng cho phần tử HTML {{HTMLElement('input')}} (hoặc phần tử `<meter>` hay `<progress>`), tên truy cập được có thể lấy từ {{HTMLElement('label')}} liên kết. Nếu không, hãy dùng [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) nếu có nhãn hiển thị hoặc [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) nếu không có nhãn hiển thị.

Khi không dùng phần tử HTML {{HTMLElement('input')}} để tạo slider của bạn, hãy thêm thuộc tính [`tabindex`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex) để làm slider có thể focus. Trong ba kiểu range, chỉ `slider` là tương tác với người dùng, và vì vậy là kiểu duy nhất cần có khả năng nhận focus. Focus nên được đặt trên thumb của slider.

Sliders có giá trị [`aria-orientation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-orientation) ngầm định là `horizontal`. Thuộc tính này không được hỗ trợ với `meter` hoặc `progressbar`.

### Tương tác của người dùng

Không giống các vai trò `meter` và `progressbar` chỉ đọc, `slider` là một đầu vào, chấp nhận tương tác người dùng. Ngoài việc thêm thuộc tính [`tabindex`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex) để cho phép focus slider, phải triển khai hỗ trợ bàn phím và thiết bị con trỏ.

Slider biểu diễn khoảng giá trị có thể có. Vị trí của thumb slider dọc theo slider biểu diễn giá trị hiện tại. Các thao tác của người dùng phải được hỗ trợ gồm thay đổi giá trị bằng cách kéo thumb hoặc nhấp vào slider đối với thiết bị trỏ và dùng các phím hướng như phím mũi tên đối với người dùng bàn phím. Xem thêm [tương tác bàn phím](#keyboard_interactions) bên dưới.

> [!NOTE]
> Nên dùng phần tử [`<input type="range">`](/en-US/docs/Web/HTML/Reference/Elements/input/range) gốc thay vì vai trò `slider`. Tác nhân người dùng cung cấp widget có kiểu dáng cho phần tử range input, dựa trên `value` hiện tại tương ứng với giá trị tối thiểu và tối đa. Khi dùng các phần tử không ngữ nghĩa, mọi tính năng của phần tử ngữ nghĩa gốc cần được tái tạo bằng thuộc tính ARIA, JavaScript và CSS.

### Range với nhiều thumb

Slider nhiều thumb là slider có hai hoặc nhiều thumb, mỗi thumb đặt một giá trị trong một nhóm giá trị liên quan. Ví dụ, trong tìm kiếm sản phẩm, một slider hai thumb có thể được dùng để cho phép người dùng đặt giới hạn giá tối thiểu và tối đa cho tìm kiếm.

Trong nhiều slider hai thumb, các thumb không được phép vượt qua nhau, chẳng hạn khi slider đặt giá trị tối thiểu và tối đa cho một khoảng. Ví dụ, trong bộ chọn khoảng giá, giá trị tối đa của thumb đặt đầu thấp hơn của khoảng bị giới hạn bởi giá trị hiện tại của thumb đặt đầu cao hơn của khoảng. Giá trị tối thiểu của thumb đầu cao hơn cũng bị giới hạn bởi giá trị hiện tại của thumb đầu thấp hơn.

Không bắt buộc các thumb trong slider nhiều thumb phải phụ thuộc vào giá trị thumb khác, nhưng trải nghiệm người dùng trực quan là yêu cầu bắt buộc, nên nên tránh kiểu chống mẫu này.

### Mọi hậu duệ đều mang tính trình bày

Có một số kiểu thành phần giao diện người dùng khi được biểu diễn trong API truy cập của nền tảng thì chỉ có thể chứa văn bản. API truy cập không có cách biểu diễn các phần tử ngữ nghĩa nằm bên trong `slider`. Để xử lý hạn chế này, trình duyệt tự động áp dụng vai trò [`presentation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role) cho tất cả phần tử hậu duệ của bất kỳ phần tử `slider` nào, vì đây là một vai trò không hỗ trợ phần tử con ngữ nghĩa.

Ví dụ, xét phần tử `slider` sau, chứa một tiêu đề.

```html
<div role="slider"><h3>Temperature in Celsius</h3></div>
```

Vì các hậu duệ của `slider` mang tính trình bày, đoạn mã sau là tương đương:

```html
<div role="slider"><h3 role="presentation">Temperature in Celsius</h3></div>
```

Từ góc nhìn của người dùng công nghệ hỗ trợ, tiêu đề không tồn tại vì các đoạn mã trước đó tương đương với nội dung sau trong [cây truy cập](/en-US/docs/Glossary/Accessibility_tree):

```html
<div role="slider">Temperature in Celsius</div>
```

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- [`aria-valuenow`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuenow) (bắt buộc)
  - : Đặt thành một giá trị thập phân giữa `aria-valuemin` và `aria-valuemax`, cho biết giá trị hiện tại của slider.
- [`aria-valuetext`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuetext)
  - : Công nghệ hỗ trợ thường biểu diễn giá trị `aria-valuenow` như một con số. Nếu điều này không chính xác, hãy dùng `aria-valuetext` để cung cấp cho slider một giá trị dễ hiểu hơn.
- [`aria-valuemin`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemin)
  - : Đặt thành giá trị thập phân biểu diễn giá trị tối thiểu và nhỏ hơn `aria-valuemax`. Nếu không có, giá trị mặc định là 0.
- [`aria-valuemax`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemax)
  - : Đặt thành giá trị thập phân biểu diễn giá trị tối đa và lớn hơn `aria-valuemin`. Nếu không có, giá trị mặc định là 100.
- [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) hoặc [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby)
  - : Xác định giá trị chuỗi hoặc xác định phần tử (hoặc nhiều phần tử) gắn nhãn cho phần tử slider, cung cấp tên truy cập được. Tên truy cập được là bắt buộc.
- [`aria-orientation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-orientation)
  - : Cho biết hướng của phần tử là ngang, dọc, hay không rõ/mơ hồ. Với slider, giá trị ngầm định là `horizontal` nhưng có thể đặt thành `vertical`. Vì có giá trị ngầm định, hướng của slider không bao giờ mơ hồ.

### Tương tác bàn phím

| Phím(s)               | Hành động                                                          |
| --------------------- | ------------------------------------------------------------------ |
| Mũi tên phải và lên   | Tăng giá trị đã chọn lên một bước                                  |
| Mũi tên trái và xuống | Giảm giá trị đã chọn xuống một bước                                |
| Page Up               | (Tùy chọn) tăng giá trị lên một lượng đặt trước lớn hơn một bước   |
| Page Down             | (Tùy chọn) giảm giá trị xuống một lượng đặt trước lớn hơn một bước |
| Home                  | Đặt slider về giá trị tối thiểu.                                   |
| End                   | Đặt slider về giá trị tối đa.                                      |

Với các phím tùy chọn <kbd>Page Up</kbd> và <kbd>Page Down</kbd>, mức thay đổi của giá trị slider nên lớn hơn mức thay đổi từng bước được tạo bởi các phím mũi tên lên và xuống.

## Ví dụ

Trong ví dụ dưới đây, chúng ta tạo một nhiệt kế dọc để người dùng có thể đặt nhiệt độ phòng:

```html
<div>
  <div id="temperatureLabel">Temperature</div>
  <div id="temperatureValue">20°C</div>
  <div id="temperatureSlider">
    <div
      id="temperatureSliderThumb"
      role="slider"
      aria-labelledby="temperatureLabel"
      aria-orientation="vertical"
      tabindex="0"
      aria-valuemin="15.0"
      aria-valuemax="25.0"
      aria-valuenow="20.0"
      aria-valuetext="20 degrees Celsius"
      style="top: calc((25 - 20)*2rem - 0.5rem)"></div>
  </div>
</div>
```

Vị trí của thumb là giá trị tối đa trừ đi giá trị hiện tại nhân với chiều cao của một độ, rồi trừ một nửa chiều cao của thumb để căn giữa nó. Phần còn lại của kiểu dáng là tĩnh.

```css
[id="temperatureSlider"] {
  position: relative;
  height: 20rem;
  width: 1rem;
  outline: 1px solid;
  margin: 3rem;
}

[id="temperatureSliderThumb"] {
  position: absolute;
  height: 1rem;
  width: 2rem;
  background-color: currentColor;
  left: -0.5rem;
}
```

Để ví dụ này hoạt động, chúng ta phải viết một script để xử lý tất cả sự kiện bàn phím và con trỏ, bao gồm các trình lắng nghe sự kiện cho `pointermove`, `pointerup`, `focus`, `blur`, và `keydown`, đồng thời cung cấp kiểu dáng cho trạng thái mặc định và khi thumb và slider nhận focus. Vị trí của thumb, các giá trị `aria-valuenow` và `aria-valuetext`, và văn bản bên trong phần tử có [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) "temperatureValue" cần được cập nhật mỗi khi các phím <kbd>ArrowLeft</kbd>, <kbd>ArrowDown</kbd>, <kbd>ArrowRight</kbd>, <kbd>ArrowUp</kbd>, <kbd>Home</kbd>, <kbd>End</kbd>, và tùy chọn <kbd>PageDown</kbd> và <kbd>PageUp</kbd> được nhả ra, và khi người dùng kéo thumb hoặc nhấp vào slider nhiệt độ.

Sử dụng HTML ngữ nghĩa, có thể viết như sau:

```html
<label for="temperature"> Temperature </label>
<output id="temperatureValue">20°C</output>
<input
  type="range"
  id="temperatureSlider"
  min="15"
  max="25"
  step="0.1"
  value="20"
  aria-valuetext="20 degrees celsius" />
```

```css
#temperatureSlider {
  transform: rotate(-90deg);
}
```

Bằng cách dùng {{HTMLElement('input')}}, chúng ta có một widget range input đã được tạo kiểu sẵn với focus bàn phím, kiểu dáng focus, tương tác bàn phím, và `value` được cập nhật khi người dùng tương tác mà không cần thêm gì. Chúng ta vẫn cần dùng JavaScript để thay đổi `aria-valuetext` và giá trị của phần tử {{HTMLElement('output')}}.

Có vài cách để làm cho input range trở thành dọc. Trong ví dụ này, chúng ta đã dùng [CSS transforms](/en-US/docs/Web/CSS/Reference/Properties/transform).

## Thực hành tốt nhất

Nếu slider mô tả tiến trình tải của một vùng nhất định trên trang, hãy thêm thuộc tính [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby) để tham chiếu trạng thái slider, và đặt thuộc tính [`aria-busy`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-busy) thành `true` trên vùng đó cho đến khi tải xong.

`<input type="range">` của HTML ngầm định có `role` là `slider`. Không dùng các thuộc tính `aria-valuemax` hoặc `aria-valuemin` trên phần tử `<input type="range">`; hãy dùng `min` và `max` thay vào đó. Nếu không, mọi thuộc tính `aria-*` toàn cục và mọi thuộc tính `aria-*` khác áp dụng cho vai trò slider đều có thể dùng được.

### Ưu tiên HTML

Nên dùng phần tử {{HTMLElement("input")}} gốc kiểu `range`, [`<input type="range">`](/en-US/docs/Web/HTML/Reference/Elements/input/range), thay vì vai trò `slider`.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [`<input type="range">`](/en-US/docs/Web/HTML/Reference/Elements/input/range),
- Phần tử HTML {{HTMLElement('progress')}}
- Phần tử HTML {{HTMLElement('meter')}}
- Các widget range khác gồm:
  - [`meter`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/meter_role)
  - [`scrollbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/scrollbar_role)
  - [`separator`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/separator_role) (nếu có thể focus)
  - [`progressbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/progressbar_role)
  - [`spinbutton`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/spinbutton_role)
- Ví dụ thực hành W3C WAI-ARIA:
  - [Horizontal Multi-Thumb Slider](https://www.w3.org/WAI/ARIA/apg/patterns/slider-multithumb/examples/slider-multithumb/)
  - [Color Viewer Slider](https://www.w3.org/WAI/ARIA/apg/patterns/slider/examples/slider-color-viewer/)
  - [Rating Slider](https://www.w3.org/WAI/ARIA/apg/patterns/slider/examples/slider-rating/)
