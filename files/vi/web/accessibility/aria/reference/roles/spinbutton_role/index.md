---
title: "ARIA: vai trò spinbutton"
short-title: spinbutton
slug: Web/Accessibility/ARIA/Reference/Roles/spinbutton_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#spinbutton
sidebar: accessibilitysidebar
---

Vai trò `spinbutton` định nghĩa một kiểu range yêu cầu người dùng chọn giá trị từ trong số các lựa chọn rời rạc.

## Mô tả

Vai trò `spinbutton` cho biết phần tử là một widget đầu vào giới hạn giá trị của nó trong một tập hoặc một khoảng các giá trị rời rạc. Vai trò này cũng đi kèm chức năng tăng và giảm. Ví dụ, trong một widget cho phép người dùng chọn số tiền cược trong một ván Texas Holdem, vai trò `spinbutton` có thể cho phép người dùng chọn một số giữa mức cược tối thiểu và tối đa theo bước, theo luật hiện tại của trò chơi.

Spinbutton biểu diễn khoảng các giá trị có thể có. Giá trị của đầu vào spinbutton biểu diễn giá trị hiện tại.

Spinbutton thường có ba thành phần, gồm một ô văn bản hiển thị giá trị hiện tại, một nút tăng và một nút giảm. Ô văn bản thường là thành phần duy nhất có thể focus vì các chức năng tăng và giảm có thể truy cập bằng bàn phím qua các phím mũi tên. Thông thường, ô văn bản cũng cho phép người dùng chỉnh sửa trực tiếp giá trị.

Ngoài việc bao gồm thuộc tính [`tabindex`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex) để cho phép focus spinbutton, phải triển khai hỗ trợ bàn phím và thiết bị con trỏ. Các phím hướng như phím mũi tên phải được hỗ trợ cho người dùng bàn phím. Phải hỗ trợ thay đổi giá trị khi các nút tăng và giảm được nhấp đối với thiết bị trỏ. Xem [tương tác bàn phím](#keyboard_interactions) bên dưới.

> [!NOTE]
> Nên dùng phần tử [`<input type="number">`](/en-US/docs/Web/HTML/Reference/Elements/input/number), hoặc các kiểu input khác cho ngày giờ cũng ngầm định có ngữ nghĩa `role="spinbutton"`, thay vì vai trò `spinbutton`. Tác nhân người dùng cung cấp widget có kiểu dáng cho các phần tử input này, cung cấp sẵn chức năng tăng, giảm và giới hạn phạm vi gốc. Khi dùng các phần tử không ngữ nghĩa, mọi tính năng của phần tử ngữ nghĩa gốc cần được tái tạo bằng thuộc tính ARIA, JavaScript, và CSS.

### Các tùy chọn widget range ARIA

ARIA cung cấp cho nhà phát triển sáu vai trò widget range khác nhau, bao gồm `progressbar`, `meter`, `slider`, và `spinbutton`.

Vai trò [`progressbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/progressbar_role), tương tự phần tử {{HTMLElement('progress')}} của HTML, là một range chỉ đọc. Nó biểu thị phần hoàn thành của một tác vụ, tiến theo một hướng duy nhất, như thanh tiến trình tải tệp sẽ cuối cùng đạt 100% khi tải xong.

Vai trò [`meter`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/meter_role), tương tự phần tử {{HTMLElement('meter')}} của HTML, là một đồng hồ đo chỉ đọc. Nó biểu thị lượng của một thứ gì đó trong một khoảng đã biết, như chỉ báo pin của máy tính hoặc đồng hồ xăng của ô tô.

Vai trò `slider`, tương tự phần tử `input` kiểu `range` của HTML, [`<input type="range">`](/en-US/docs/Web/HTML/Reference/Elements/input/range), là một range đầu vào đọc-ghi. Slider cho phép người dùng chọn một giá trị giữa các giá trị tối thiểu và tối đa đã xác định trước. Người dùng chọn giá trị bằng cách di chuyển thumb của slider dọc theo một slider ngang hoặc dọc để chọn giá trị.

Mặc dù cả ba loại range này có cùng các trạng thái và thuộc tính ARIA, vai trò `spinbutton` là range duy nhất đọc-ghi: nó là loại duy nhất mà giá trị thay đổi qua tương tác người dùng. Vì vậy, nó phải có khả năng nhận focus. Ngoài ra, phải hỗ trợ tương tác bàn phím, nhấp chuột và cảm ứng.

> [!WARNING]
> Để thay đổi giá trị spinbutton, các công nghệ hỗ trợ dựa trên cảm ứng cần phản hồi các cử chỉ của người dùng để tăng và giảm giá trị bằng cách tạo ra các sự kiện phím tổng hợp.
> Hãy kiểm thử đầy đủ các widget spinbutton bằng công nghệ hỗ trợ trên các thiết bị mà cảm ứng là cơ chế nhập liệu chính trước khi dùng vai trò `spinbutton` (và mọi widget range).

### Các thuộc tính chung

Thuộc tính [`aria-valuemin`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemin) đặt giá trị tối thiểu. Nếu bỏ qua hoặc không phải số, nó mặc định là `0` (không).

Thuộc tính [`aria-valuemax`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemax) xác định giá trị tối đa. Nếu thiếu hoặc không phải số, nó mặc định là `100`.

Giá trị thuộc tính [`aria-valuenow`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuenow) phải nằm giữa các giá trị tối thiểu và tối đa, bao gồm cả hai đầu. Thuộc tính này là bắt buộc cho `meter` và tùy chọn cho `progressbar`.

Đối với `spinbutton`, trừ khi dùng các phần tử HTML ngữ nghĩa như [`<input type="number">`](/en-US/docs/Web/HTML/Reference/Elements/input/number), nếu giá trị được cập nhật thì giá trị `aria-valuenow` cũng phải được cập nhật theo chương trình.

Thuộc tính tùy chọn [`aria-valuetext`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuetext) được thêm khi giá trị số `aria-valuenow` không phản ánh giá trị dự định của spinbutton. Các giá trị tối thiểu, tối đa và hiện tại tùy chọn nên là số. Khi các giá trị mà những con số này biểu diễn không phải số, thuộc tính `aria-valuetext` nên được thêm với một chuỗi xác định giá trị số đó. Ví dụ, nếu dùng spinbutton cho cỡ áo thun, thuộc tính `aria-valuetext` nên thay đổi từ `XX-Small` đến `XX-Large` khi `aria-valuenow` tăng lên.

Giá trị `aria-valuetext` phải được cập nhật khi giá trị hoặc `aria-valuenow` được cập nhật. Thuộc tính ARIA được hỗ trợ trên các phần tử HTML ngữ nghĩa. Mặc dù không có thuộc tính HTML tương đương cho `<input>`, bạn có thể thêm `aria-valuetext` vào bất kỳ kiểu {{htmlelement('input')}} nào. Khi `aria-valuetext` là một tính năng quan trọng cho spinbutton, hãy cân nhắc dùng {{HTMLElement('select')}} cùng các phần tử {{HTMLElement('option')}} thay vào đó.

Tên truy cập được là **bắt buộc**. Nếu vai trò `spinbutton` được áp dụng cho một phần tử HTML {{HTMLElement('input')}}, tên truy cập được có thể lấy từ {{HTMLElement('label')}} liên kết. Nếu không, hãy dùng [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) nếu có nhãn hiển thị hoặc [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) nếu không có nhãn hiển thị.

Khi không dùng phần tử HTML {{HTMLElement('input')}} để tạo spinbutton, hãy thêm thuộc tính [`tabindex`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex) để làm spinbutton có thể focus. Vai trò `spinbutton` là tương tác với người dùng, vì vậy phải có khả năng nhận focus. Focus nên được đặt trên đầu vào spinbutton chứ không phải trên các nút liên quan dùng để tăng và giảm giá trị spinbutton.

### Phần tử con giới hạn ở nút hoặc văn bản

Có một số kiểu thành phần giao diện người dùng khi được biểu diễn trong API truy cập của nền tảng thì chỉ có thể chứa nội dung cụ thể. Các phần tử con hoặc phần tử được sở hữu của `spinbutton` bị giới hạn ở một textbox và hai nút. Ngoài ra, vai trò `spinbutton` có thể được áp dụng cho một input `text` và các nút anh em có thể được dùng để hỗ trợ chức năng tăng và giảm.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- [`aria-valuenow`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuenow)
  - : Đặt thành một giá trị thập phân giữa `aria-valuemin` và `aria-valuemax`, cho biết giá trị hiện tại của spinbutton. Nếu không có, phần tử spinbutton không có giá trị hiện tại.

- [`aria-valuetext`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuetext)
  - : Công nghệ hỗ trợ thường biểu diễn giá trị `aria-valuenow` như một con số. Nếu `aria-valuenow` không thể chính xác, hãy dùng `aria-valuetext` để cung cấp cho spinbutton một giá trị dễ hiểu hơn.

- [`aria-valuemin`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemin)
  - : Đặt thành giá trị thập phân biểu diễn giá trị tối thiểu và nhỏ hơn `aria-valuemax`. Nếu không có, không có giá trị mặc định.

- [`aria-valuemax`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemax)
  - : Đặt thành giá trị thập phân biểu diễn giá trị tối đa và lớn hơn `aria-valuemin`. Nếu không có, không có giá trị mặc định.

- [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby)
  - : Xác định giá trị chuỗi hoặc xác định phần tử (hoặc nhiều phần tử) gắn nhãn cho phần tử spinbutton, cung cấp tên truy cập được. Tên truy cập được là bắt buộc.
- [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label)
  - : Xác định một giá trị chuỗi gắn nhãn cho phần tử spinbutton. Điều này cung cấp tên truy cập được cho phần tử khi không có nhãn hiển thị nào có thể cung cấp tên bắt buộc qua {{HTMLElement('label')}} hoặc `aria-labelledby`.

### Tương tác bàn phím

| Phím(s)               | Hành động                                                                    |
| --------------------- | ---------------------------------------------------------------------------- |
| Mũi tên phải và lên   | Tăng giá trị đã chọn lên một bước                                            |
| Mũi tên trái và xuống | Giảm giá trị đã chọn xuống một bước                                          |
| Page Up               | (Tùy chọn) Tăng giá trị lên một lượng đặt trước lớn hơn hoặc bằng một bước   |
| Page Down             | (Tùy chọn) Giảm giá trị xuống một lượng đặt trước lớn hơn hoặc bằng một bước |
| Home                  | Đặt spinbutton về giá trị tối thiểu                                          |
| End                   | Đặt spinbutton về giá trị tối đa                                             |

Với các phím tùy chọn <kbd>Page Up</kbd> và <kbd>Page Down</kbd>, mức thay đổi của giá trị spinbutton nên lớn hơn mức thay đổi từng bước được tạo bởi các phím mũi tên lên và xuống.

## Ví dụ

Trong ví dụ dưới đây, vai trò `spinbutton` được định nghĩa để cho phép người dùng chọn ngày trong tháng.

```html
<p id="day">Enter the day of the month</p>
<button type="button" tabindex="-1" aria-label="previous day">˱</button>
<div
  role="spinbutton"
  tabindex="0"
  aria-valuenow="1"
  aria-valuetext="first"
  aria-valuemin="1"
  aria-valuemax="31"
  aria-labelledby="day">
  1
</div>
<button type="button" tabindex="-1" aria-label="next day">˲</button>
```

Trong ví dụ này, chúng ta đã dùng `tabindex` âm để loại các nút khỏi thứ tự tab mặc định. Chúng ta cũng thêm `tabindex` vào một {{HTMLElement('div')}} vốn không tương tác để đưa chính `spinbutton` vào thứ tự tab. Ví dụ này yêu cầu JavaScript để xử lý các hành động bàn phím khi spinbutton có focus và khi người dùng chuột nhấp vào các nút.

### Với HTML ngữ nghĩa

Cũng có thể viết bằng HTML ngữ nghĩa, loại bỏ nhu cầu về CSS hay JavaScript và cũng loại bỏ nhu cầu bao gồm và cung cấp chức năng cho các nút tăng giảm dư thừa. Đoạn mã dưới đây cho thấy ví dụ trước đó nhưng không dùng vai trò `spinbutton` và dùng HTML ngữ nghĩa.

```html
<label for="day">Enter the day of the month</label>
<input
  type="number"
  value="1"
  aria-valuetext="first"
  min="1"
  max="31"
  id="day" />
```

{{EmbedLiveSample("With_semantic_HTML", 50, 50)}}

Trong trường hợp này, JavaScript duy nhất cần thiết là để cập nhật `aria-valuetext` khi giá trị input thay đổi, và thực ra trong trường hợp này đây là một tính năng tùy chọn.

## Thực hành tốt nhất

`<input type="number">` của HTML ngầm định có `role` là `spinbutton`. `<input type="date">` của HTML có 3 spin button lồng nhau, mỗi cái cho tháng, ngày và năm. Khi dùng các phần tử form HTML ngữ nghĩa đúng với mục đích của chúng, đừng dùng các thuộc tính `aria-valuemax` hoặc `aria-valuemin`; hãy dùng `min` và `max` thay vào đó. Nếu không, mọi thuộc tính `aria-*` toàn cục và mọi thuộc tính `aria-*` khác đều áp dụng cho vai trò `spinbutton`.

### Ưu tiên HTML ngữ nghĩa

Nên dùng phần tử {{HTMLElement("input")}} gốc kiểu `number`, [`<input type="number">`](/en-US/docs/Web/HTML/Reference/Elements/input/number), thay vì vai trò `spinbutton`.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [`<input type="number">`](/en-US/docs/Web/HTML/Reference/Elements/input/number)
- [`<input type="date">`](/en-US/docs/Web/HTML/Reference/Elements/input/date)
- [`<input type="time">`](/en-US/docs/Web/HTML/Reference/Elements/input/time)
- Các widget range khác gồm:
  - [`meter`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/meter_role)
  - [`scrollbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/scrollbar_role)
  - [`separator`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/separator_role) (nếu có thể focus)
  - [`progressbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/progressbar_role)
  - [`slider`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/slider_role)
- Ví dụ đang hoạt động:
  - [Date picker spin button example](https://www.w3.org/WAI/ARIA/apg/patterns/spinbutton/examples/datepicker-spinbuttons/)
  - [Toolbar example: font-size picker](https://www.w3.org/WAI/ARIA/apg/patterns/toolbar/examples/toolbar/)
