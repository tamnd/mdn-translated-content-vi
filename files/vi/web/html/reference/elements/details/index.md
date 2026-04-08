---
title: "<details>: Phần tử tiết lộ chi tiết"
slug: Web/HTML/Reference/Elements/details
page-type: html-element
browser-compat: html.elements.details
sidebar: htmlsidebar
---

Phần tử **`<details>`** trong [HTML](/en-US/docs/Web/HTML) tạo ra một tiện ích tiết lộ thông tin, trong đó nội dung chỉ hiển thị khi tiện ích được chuyển sang trạng thái mở. Cần cung cấp tóm tắt hoặc nhãn thông qua phần tử {{HTMLElement("summary")}}.

Một tiện ích tiết lộ thường được hiển thị trên màn hình bằng một tam giác nhỏ xoay (hoặc vặn) để biểu thị trạng thái mở/đóng, cùng với nhãn bên cạnh tam giác. Nội dung của phần tử `<summary>` được dùng làm nhãn cho tiện ích tiết lộ. Nội dung của `<details>` cung cấp {{glossary("accessible description")}} (mô tả có thể tiếp cận) cho `<summary>`.

{{InteractiveExample("HTML Demo: &lt;details&gt;", "tabbed-shorter")}}

```html interactive-example
<details>
  <summary>Details</summary>
  Something small enough to escape casual notice.
</details>
```

```css interactive-example
details {
  border: 1px solid #aaaaaa;
  border-radius: 4px;
  padding: 0.5em 0.5em 0;
}

summary {
  font-weight: bold;
  margin: -0.5em -0.5em 0;
  padding: 0.5em;
}

details[open] {
  padding: 0.5em;
}

details[open] summary {
  border-bottom: 1px solid #aaaaaa;
  margin-bottom: 0.5em;
}
```

Tiện ích `<details>` có thể ở một trong hai trạng thái. Trạng thái _đóng_ mặc định chỉ hiển thị tam giác và nhãn bên trong `<summary>` (hoặc chuỗi mặc định do {{Glossary("user agent")}} xác định nếu không có `<summary>`).

Khi người dùng nhấp vào tiện ích hoặc lấy tiêu điểm rồi nhấn thanh dấu cách, tiện ích sẽ "vặn" ra, hiển thị nội dung của nó. Tam giác thường xoay để biểu thị việc mở hoặc đóng tiện ích, đó là lý do tại sao chúng đôi khi được gọi là "twisty".

Bạn có thể dùng CSS để tạo kiểu cho tiện ích tiết lộ và có thể lập trình để mở/đóng tiện ích bằng cách thêm/xóa thuộc tính [`open`](#open). Tuy nhiên hiện tại không có cách tích hợp sẵn để tạo hiệu ứng chuyển đổi giữa trạng thái mở và đóng.

Mặc định khi đóng, tiện ích chỉ đủ cao để hiển thị tam giác tiết lộ và tóm tắt. Khi mở, nó mở rộng để hiển thị nội dung chi tiết bên trong.

Các triển khai tuân thủ đầy đủ tiêu chuẩn tự động áp dụng CSS `{{cssxref("display")}}: list-item` cho phần tử {{HTMLElement("summary")}}. Bạn có thể dùng điều này hoặc phần tử giả {{cssxref("::marker")}} để [tùy chỉnh tiện ích tiết lộ](/en-US/docs/Web/HTML/Reference/Elements/summary#changing_the_summarys_icon).

## Thuộc tính

Phần tử này bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `open`
  - : Thuộc tính Boolean này cho biết liệu chi tiết — tức là nội dung của phần tử `<details>` — có đang hiển thị hay không. Chi tiết được hiển thị khi thuộc tính này tồn tại, hoặc bị ẩn khi thuộc tính này vắng mặt. Mặc định thuộc tính này vắng mặt, nghĩa là chi tiết không được hiển thị.

    > [!NOTE]
    > Bạn phải xóa hoàn toàn thuộc tính này để ẩn chi tiết. `open="false"` làm cho chi tiết hiển thị vì thuộc tính này là Boolean.

- `name`
  - : Thuộc tính này cho phép kết nối nhiều phần tử `<details>` với nhau, chỉ có một phần tử được mở tại một thời điểm. Điều này giúp các nhà phát triển dễ dàng tạo các tính năng giao diện như accordion mà không cần scripting.

    Thuộc tính `name` chỉ định tên nhóm — đặt cho nhiều phần tử `<details>` cùng giá trị `name` để nhóm chúng lại. Chỉ một trong các phần tử `<details>` được nhóm có thể mở tại một thời điểm — mở một phần tử sẽ khiến phần tử khác đóng lại. Nếu nhiều phần tử `<details>` được nhóm có thuộc tính `open`, chỉ phần tử đầu tiên theo thứ tự nguồn sẽ được hiển thị mở.

    > [!NOTE]
    > Các phần tử `<details>` không cần phải liền kề nhau trong nguồn để thuộc cùng một nhóm.

## Sự kiện

Ngoài các sự kiện thông thường được hỗ trợ bởi các phần tử HTML, phần tử `<details>` hỗ trợ sự kiện {{domxref("HTMLElement/toggle_event", "toggle")}}, được phát đến phần tử `<details>` bất cứ khi nào trạng thái của nó thay đổi giữa mở và đóng. Nó được gửi _sau_ khi trạng thái thay đổi, mặc dù nếu trạng thái thay đổi nhiều lần trước khi trình duyệt có thể phát sự kiện, các sự kiện được hợp nhất để chỉ gửi một sự kiện.

Bạn có thể dùng trình lắng nghe sự kiện cho sự kiện `toggle` để phát hiện khi tiện ích thay đổi trạng thái:

```js
details.addEventListener("toggle", (event) => {
  if (details.open) {
    /* phần tử đã được chuyển sang trạng thái mở */
  } else {
    /* phần tử đã được chuyển sang trạng thái đóng */
  }
});
```

## Ví dụ

### Ví dụ tiết lộ cơ bản

Ví dụ này hiển thị một phần tử `<details>` cơ bản với `<summary>`.

```html
<details>
  <summary>System Requirements</summary>
  <p>
    Requires a computer running an operating system. The computer must have some
    memory and ideally some kind of long-term storage. An input device as well
    as some form of output device is recommended.
  </p>
</details>
```

#### Kết quả

{{EmbedLiveSample("A_basic_disclosure_example", 650, 150)}}

### Tạo hộp tiết lộ ở trạng thái mở

Để khởi động hộp `<details>` ở trạng thái mở, thêm thuộc tính Boolean `open`:

```html
<details open>
  <summary>System Requirements</summary>
  <p>
    Requires a computer running an operating system. The computer must have some
    memory and ideally some kind of long-term storage. An input device as well
    as some form of output device is recommended.
  </p>
</details>
```

#### Kết quả

{{EmbedLiveSample("Creating_an_open_disclosure_box", 650, 150)}}

### Nhiều hộp tiết lộ có tên

Chúng ta bao gồm nhiều hộp `<details>`, tất cả có cùng tên để chỉ có thể mở một hộp tại một thời điểm:

```html
<details name="requirements">
  <summary>Graduation Requirements</summary>
  <p>
    Requires 40 credits, including a passing grade in health, geography,
    history, economics, and wood shop.
  </p>
</details>
<details name="requirements">
  <summary>System Requirements</summary>
  <p>
    Requires a computer running an operating system. The computer must have some
    memory and ideally some kind of long-term storage. An input device as well
    as some form of output device is recommended.
  </p>
</details>
<details name="requirements">
  <summary>Job Requirements</summary>
  <p>
    Requires knowledge of HTML, CSS, JavaScript, accessibility, web performance,
    privacy, security, and internationalization, as well as a dislike of
    broccoli.
  </p>
</details>
```

#### Kết quả

{{EmbedLiveSample("Multiple named disclosure boxes", 650, 150)}}

Hãy thử mở tất cả các tiện ích tiết lộ. Khi bạn mở một tiện ích, tất cả các tiện ích còn lại sẽ tự động đóng.

### Tùy chỉnh giao diện

Bây giờ hãy áp dụng một số CSS để tùy chỉnh giao diện của hộp tiết lộ.

#### CSS

```css
details {
  font:
    16px "Open Sans",
    "Calibri",
    sans-serif;
  width: 620px;
}

details > summary {
  padding: 2px 6px;
  width: 15em;
  background-color: #dddddd;
  border: none;
  box-shadow: 3px 3px 4px black;
  cursor: pointer;
}

details > p {
  border-radius: 0 0 10px 10px;
  background-color: #dddddd;
  padding: 2px 6px;
  margin: 0;
  box-shadow: 3px 3px 4px black;
}

details:open > summary {
  background-color: #ccccff;
}
```

CSS này tạo ra giao diện tương tự như giao diện tab, khi nhấp vào tab sẽ mở ra để hiển thị nội dung.

> [!NOTE]
> Trong các trình duyệt không hỗ trợ lớp giả {{cssxref(":open")}}, bạn có thể dùng bộ chọn thuộc tính `details[open]` để tạo kiểu cho phần tử `<details>` khi ở trạng thái mở.

#### HTML

```html
<details>
  <summary>System Requirements</summary>
  <p>
    Requires a computer running an operating system. The computer must have some
    memory and ideally some kind of long-term storage. An input device as well
    as some form of output device is recommended.
  </p>
</details>
```

#### Kết quả

{{EmbedLiveSample("Customizing_the_appearance", 650, 150)}}

Xem trang {{htmlelement("summary")}} để có [ví dụ về tùy chỉnh tiện ích tiết lộ](/en-US/docs/Web/HTML/Reference/Elements/summary#changing_the_summarys_icon).

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
        >, gốc phân đoạn, nội dung tương tác, nội dung hữu hình.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        Một phần tử {{HTMLElement("summary")}} theo sau bởi
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >nội dung luồng</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ thẻ</th>
      <td>Không, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >nội dung luồng</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role"><code>group</code></a></td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Không có <code>role</code> nào được phép</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLDetailsElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("summary")}}
- {{cssxref("::details-content")}}
