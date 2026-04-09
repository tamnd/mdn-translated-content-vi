---
title: "<time>: The (Date) Time element"
slug: Web/HTML/Reference/Elements/time
page-type: html-element
browser-compat: html.elements.time
sidebar: htmlsidebar
---

Phần tử **`<time>`** trong [HTML](/en-US/docs/Web/HTML) đại diện cho một khoảng thời gian cụ thể. Nó có thể bao gồm thuộc tính `datetime` để chuyển đổi ngày tháng sang định dạng máy đọc được, cho phép kết quả tìm kiếm tốt hơn hoặc các tính năng tùy chỉnh như nhắc nhở.

Nó có thể đại diện cho một trong những điều sau:

- Một thời điểm trên đồng hồ 24 giờ.
- Một ngày chính xác trong [lịch Gregory](https://en.wikipedia.org/wiki/Gregorian_calendar) (với thông tin thời gian và múi giờ tùy chọn).
- [Khoảng thời gian hợp lệ](https://html.spec.whatwg.org/multipage/common-microsyntaxes.html#valid-duration-string).

{{InteractiveExample("HTML Demo: &lt;time&gt;", "tabbed-shorter")}}

```html interactive-example
<p>
  The Cure will be celebrating their 40th anniversary on
  <time datetime="2018-07-07">July 7</time> in London's Hyde Park.
</p>

<p>
  The concert starts at <time datetime="20:00">20:00</time> and you'll be able
  to enjoy the band for at least <time datetime="PT2H30M">2h 30m</time>.
</p>
```

```css interactive-example
time {
  font-weight: bold;
}
```

## Thuộc tính

Giống như tất cả các phần tử HTML khác, phần tử này hỗ trợ các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `datetime`
  - : Thuộc tính này chỉ ra thời gian và/hoặc ngày tháng của phần tử và phải ở một trong các định dạng được mô tả bên dưới.

## Ghi chú sử dụng

Phần tử này dùng để trình bày ngày tháng và thời gian theo định dạng máy đọc được. Ví dụ, điều này có thể giúp tác nhân người dùng đề nghị thêm sự kiện vào lịch của người dùng.

Phần tử này không nên được dùng cho các ngày tháng trước khi lịch Gregory được giới thiệu (do sự phức tạp trong việc tính toán những ngày đó).

_Giá trị datetime_ (giá trị máy đọc được của datetime) là giá trị của thuộc tính `datetime` của phần tử, phải ở định dạng phù hợp (xem bên dưới). Nếu phần tử không có thuộc tính `datetime`, **nó không được có bất kỳ phần tử con nào**, và _giá trị datetime_ là nội dung văn bản con của phần tử.

### Các giá trị datetime hợp lệ

<table class="no-markdown">
  <thead>
    <tr>
      <th scope="col">Mô tả</th>
      <th scope="col">Microsyntax</th>
      <th scope="col">Ví dụ</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Chuỗi tháng hợp lệ</td>
      <td><code><em>YYYY</em>-<em>MM</em></code></td>
      <td><code>2011-11</code>, <code>2013-05</code></td>
    </tr>
    <tr>
      <td>Chuỗi ngày hợp lệ</td>
      <td><code><em>YYYY</em>-<em>MM</em>-<em>DD</em></code></td>
      <td><code>1887-12-01</code></td>
    </tr>
    <tr>
      <td>Chuỗi ngày không có năm hợp lệ</td>
      <td><code><em>MM</em>-<em>DD</em></code></td>
      <td><code>11-12</code></td>
    </tr>
    <tr>
      <td>Chuỗi thời gian hợp lệ</td>
      <td>
        <code><em>HH</em>:<em>MM</em></code><br />
        <code><em>HH</em>:<em>MM</em>:<em>SS</em></code><br />
        <code><em>HH</em>:<em>MM</em>:<em>SS</em>.<em>mmm</em></code>
      </td>
      <td>
        <code>23:59</code><br />
        <code>12:15:47</code><br />
        <code>12:15:52.998</code>
      </td>
    </tr>
    <tr>
      <td>Chuỗi ngày và giờ địa phương hợp lệ</td>
      <td>
        <code><em>YYYY</em>-<em>MM</em>-<em>DD</em> <em>HH</em>:<em>MM</em></code><br />
        <code><em>YYYY</em>-<em>MM</em>-<em>DD</em> <em>HH</em>:<em>MM</em>:<em>SS</em></code><br />
        <code><em>YYYY</em>-<em>MM</em>-<em>DD</em> <em>HH</em>:<em>MM</em>:<em>SS</em>.<em>mmm</em></code><br />
        <code><em>YYYY</em>-<em>MM</em>-<em>DD</em>T<em>HH</em>:<em>MM</em></code><br />
        <code><em>YYYY</em>-<em>MM</em>-<em>DD</em>T<em>HH</em>:<em>MM</em>:<em>SS</em></code><br />
        <code><em>YYYY</em>-<em>MM</em>-<em>DD</em>T<em>HH</em>:<em>MM</em>:<em>SS</em>.<em>mmm</em></code>
      </td>
      <td>
        <code>2013-12-25 11:12</code><br />
        <code>1972-07-25 13:43:07</code><br />
        <code>1941-03-15 07:06:23.678</code><br />
        <code>2013-12-25T11:12</code><br />
        <code>1972-07-25T13:43:07</code><br />
        <code>1941-03-15T07:06:23.678</code>
      </td>
    </tr>
    <tr>
      <td>Chuỗi độ lệch múi giờ hợp lệ</td>
      <td>
        <code>Z</code><br />
        <code>+<em>HHMM</em></code><br />
        <code>+<em>HH</em>:<em>MM</em></code><br />
        <code>-<em>HHMM</em></code><br />
        <code>-<em>HH</em>:<em>MM</em></code>
      </td>
      <td>
        <code>Z</code><br />
        <code>+0200</code><br />
        <code>+04:30</code><br />
        <code>-0300</code><br />
        <code>-08:00</code>
      </td>
    </tr>
    <tr>
      <td>Chuỗi ngày và giờ toàn cầu hợp lệ</td>
      <td style="max-width:12em">
        Bất kỳ sự kết hợp nào của chuỗi ngày và giờ địa phương hợp lệ theo sau bởi
        chuỗi độ lệch múi giờ hợp lệ
      </td>
      <td>
        <code>2013-12-25 11:12+0200</code><br />
        <code>1972-07-25 13:43:07+04:30</code><br />
        <code>1941-03-15 07:06:23.678Z</code><br />
        <code>2013-12-25T11:12-08:00</code>
      </td>
    </tr>
    <tr>
      <td>Chuỗi tuần hợp lệ</td>
      <td><code><em>YYYY</em>-W<em>WW</em></code></td>
      <td><code>2013-W46</code></td>
    </tr>
    <tr>
      <td>Bốn hoặc nhiều chữ số ASCII</td>
      <td><code><em>YYYY</em></code></td>
      <td><code>2013</code>, <code>0001</code></td>
    </tr>
    <tr>
      <td>Chuỗi khoảng thời gian hợp lệ</td>
      <td>
        <code>P<em>d</em>DT<em>h</em>H<em>m</em>M<em>s</em>S</code><br />
        <code>P<em>d</em>DT<em>h</em>H<em>m</em>M<em>s</em>.<em>X</em>S</code><br />
        <code>P<em>d</em>DT<em>h</em>H<em>m</em>M<em>s</em>.<em>XX</em>S</code><br />
        <code>P<em>d</em>DT<em>h</em>H<em>m</em>M<em>s</em>.<em>XXX</em>S</code><br />
        <code>PT<em>h</em>H<em>m</em>M<em>s</em>S</code><br />
        <code>PT<em>h</em>H<em>m</em>M<em>s</em>.<em>X</em>S</code><br />
        <code>PT<em>h</em>H<em>m</em>M<em>s</em>.<em>XX</em>S</code><br />
        <code>PT<em>h</em>H<em>m</em>M<em>s</em>.<em>XXX</em>S</code><br />
        <code><em>w</em>w <em>d</em>d <em>h</em>h <em>m</em>m <em>s</em>s</code>
      </td>
      <td>
        <code>P12DT7H12M13S</code><br />
        <code>P12DT7H12M13.3S</code><br />
        <code>P12DT7H12M13.45S</code><br />
        <code>P12DT7H12M13.455S</code><br />
        <code>PT7H12M13S</code><br />
        <code>PT7H12M13.2S</code><br />
        <code>PT7H12M13.56S</code><br />
        <code>PT7H12M13.999S</code><br />
        <code>7d 5h 24m 13s</code>
      </td>
    </tr>
  </tbody>
</table>

## Ví dụ

### Ví dụ cơ bản

#### HTML

```html
<p>The concert starts at <time datetime="2018-07-07T20:00:00">20:00</time>.</p>
```

#### Kết quả

{{EmbedLiveSample('Basic_example', 250, 80)}}

### Ví dụ `datetime`

#### HTML

```html
<p>
  The concert took place on <time datetime="2001-05-15T19:00">May 15</time>.
</p>
```

#### Kết quả

{{EmbedLiveSample('datetime_example', 250, 80)}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung luồng</a
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >, nội dung rõ ràng.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >Nội dung cụm từ</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ thẻ</th>
      <td>Không được phép, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles#structural_roles_with_html_equivalents">time</a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Bất kỳ</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLTimeElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử {{HTMLElement("data")}}, cho phép biểu thị các loại giá trị khác.
