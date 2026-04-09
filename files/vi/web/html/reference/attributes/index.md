---
title: HTML attribute reference
short-title: Attributes
slug: Web/HTML/Reference/Attributes
page-type: landing-page
sidebar: htmlsidebar
---

Các phần tử trong HTML có **thuộc tính** (attributes); đây là các giá trị bổ sung dùng để cấu hình phần tử hoặc điều chỉnh hành vi của chúng theo nhiều cách khác nhau để đáp ứng các tiêu chí mà người dùng mong muốn.

## Danh sách thuộc tính

<table class="standard-table">
  <thead>
    <tr>
      <th>Tên thuộc tính</th>
      <th>Phần tử</th>
      <th>Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/accept">accept</a></code>
      </td>
      <td>
        {{ HTMLElement("form") }}, {{ HTMLElement("input") }}
      </td>
      <td>Danh sách các kiểu mà máy chủ chấp nhận, thường là kiểu tệp.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/form#accept-charset">accept-charset</a></code>
      </td>
      <td>{{ HTMLElement("form") }}</td>
      <td>Bộ ký tự, nếu được cung cấp thì phải là <code>"UTF-8"</code>.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Global_attributes/accesskey">accesskey</a></code>
      </td>
      <td>
        <a href="/en-US/docs/Web/HTML/Reference/Global_attributes">Thuộc tính toàn cục</a>
      </td>
      <td>Phím tắt để kích hoạt hoặc thêm tiêu điểm vào phần tử.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/form#action">action</a></code>
      </td>
      <td>{{ HTMLElement("form") }}</td>
      <td>
        URI của chương trình xử lý thông tin được gửi qua biểu mẫu.
      </td>
    </tr>
    <tr>
      <td>
        <code>align</code> {{deprecated_inline}}
      </td>
      <td>
        {{ HTMLElement("caption") }}, {{ HTMLElement("col") }},
        {{ HTMLElement("colgroup") }},
        {{ HTMLElement("hr") }}, {{ HTMLElement("iframe") }},
        {{ HTMLElement("img") }}, {{ HTMLElement("table") }},
        {{ HTMLElement("tbody") }}, {{ HTMLElement("td") }},
        {{ HTMLElement("tfoot") }}, {{ HTMLElement("th") }},
        {{ HTMLElement("thead") }}, {{ HTMLElement("tr") }}
      </td>
      <td>Chỉ định căn chỉnh ngang của phần tử.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/iframe#allow">allow</a></code>
      </td>
      <td>{{ HTMLElement("iframe") }}</td>
      <td>Chỉ định feature policy cho iframe.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/input/color#alpha">alpha</a></code>
      </td>
      <td>{{ HTMLElement("input") }}</td>
      <td>Cho phép người dùng chọn độ trong suốt của màu trên input <code>type="color"</code>.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/alt">alt</a></code>
      </td>
      <td>
        {{ HTMLElement("area") }},
        {{ HTMLElement("img") }}, {{ HTMLElement("input") }}
      </td>
      <td>Văn bản thay thế khi hình ảnh không thể hiển thị.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/link#as">as</a></code>
      </td>
      <td>
        {{ HTMLElement("link") }}
      </td>
      <td>Chỉ định loại nội dung đang được tải bởi liên kết.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/script#async">async</a></code>
      </td>
      <td>{{ HTMLElement("script") }}</td>
      <td>Thực thi script một cách bất đồng bộ.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Global_attributes/autocapitalize">autocapitalize</a></code>
      </td>
      <td>
        <a href="/en-US/docs/Web/HTML/Reference/Global_attributes">Thuộc tính toàn cục</a>
      </td>
      <td>
        Đặt xem nội dung nhập vào có tự động viết hoa hay không khi người dùng nhập
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/autocomplete">autocomplete</a></code>
      </td>
      <td>
        {{ HTMLElement("form") }}, {{ HTMLElement("input") }},
        {{ HTMLElement("select") }},
        {{ HTMLElement("textarea") }}
      </td>
      <td>
        Cho biết liệu các điều khiển trong biểu mẫu này có thể theo mặc định được trình duyệt tự động điền giá trị hay không.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/autoplay">autoplay</a></code>
      </td>
      <td>
        {{ HTMLElement("audio") }},
        {{ HTMLElement("video") }}
      </td>
      <td>Âm thanh hoặc video sẽ phát càng sớm càng tốt.</td>
    </tr>
    <tr>
      <td><code>background</code></td>
      <td>
        {{ HTMLElement("body") }}, {{ HTMLElement("table") }},
        {{ HTMLElement("td") }}, {{ HTMLElement("th") }}
      </td>
      <td>
        Chỉ định URL của tệp hình ảnh.
        <div class="note notecard">
          <p>
            <strong>Lưu ý:</strong> Mặc dù trình duyệt và ứng dụng email vẫn có thể
            hỗ trợ thuộc tính này, nhưng nó đã lỗi thời. Hãy sử dụng CSS
            {{ Cssxref("background-image") }} thay thế.
          </p>
        </div>
      </td>
    </tr>
    <tr>
      <td><code>bgcolor</code></td>
      <td>
        {{ HTMLElement("body") }}, {{ HTMLElement("col") }},
        {{ HTMLElement("colgroup") }},
        {{ HTMLElement("marquee") }},
        {{ HTMLElement("table") }},
        {{ HTMLElement("tbody") }},
        {{ HTMLElement("tfoot") }}, {{ HTMLElement("td") }},
        {{ HTMLElement("th") }}, {{ HTMLElement("tr") }}
      </td>
      <td>
        <p>Màu nền của phần tử.</p>
        <div class="note notecard">
          <p>
            <strong>Lưu ý:</strong> Đây là thuộc tính cũ. Hãy sử dụng thuộc tính
            CSS {{ Cssxref("background-color") }} thay thế.
          </p>
        </div>
      </td>
    </tr>
    <tr>
      <td><code>border</code></td>
      <td>
        {{ HTMLElement("img") }}, {{ HTMLElement("object") }},
        {{ HTMLElement("table") }}
      </td>
      <td>
        <p>Độ rộng của đường viền.</p>
        <div class="note notecard">
          <p>
            <strong>Lưu ý:</strong> Đây là thuộc tính cũ. Hãy sử dụng thuộc tính
            CSS {{ Cssxref("border") }} thay thế.
          </p>
        </div>
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/capture">capture</a></code>
      </td>
      <td>{{ HTMLElement("input") }}</td>
      <td>
        Theo <a href="https://w3c.github.io/html-media-capture/#the-capture-attribute">đặc tả Media Capture</a>,
        chỉ định rằng có thể chụp một tệp mới.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/meta#charset">charset</a></code>
      </td>
      <td>
        {{ HTMLElement("meta") }}
      </td>
      <td>Khai báo mã hóa ký tự của trang hoặc script.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/input#checked">checked</a></code>
      </td>
      <td>
        {{ HTMLElement("input") }}
      </td>
      <td>Cho biết liệu phần tử có nên được chọn khi tải trang không.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/cite">cite</a></code>
      </td>
      <td>
        {{ HTMLElement("blockquote") }},
        {{ HTMLElement("del") }}, {{ HTMLElement("ins") }},
        {{ HTMLElement("q") }}
      </td>
      <td>Chứa URI trỏ đến nguồn của trích dẫn hoặc thay đổi.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Global_attributes/class">class</a></code>
      </td>
      <td>
        <a href="/en-US/docs/Web/HTML/Reference/Global_attributes">Thuộc tính toàn cục</a>
      </td>
      <td>Thường được dùng với CSS để tạo kiểu cho các phần tử có thuộc tính chung.</td>
    </tr>
    <tr>
      <td><code>color</code></td>
      <td>
        {{ HTMLElement("font") }}, {{ HTMLElement("hr") }}
      </td>
      <td>
        <p>
          Thuộc tính này đặt màu chữ bằng tên màu hoặc màu được chỉ định
          theo định dạng thập lục phân #RRGGBB.
        </p>
        <div class="note notecard">
          <p>
            <strong>Lưu ý:</strong> Đây là thuộc tính cũ. Hãy sử dụng thuộc tính
            CSS {{ Cssxref("color") }} thay thế.
          </p>
        </div>
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/input/color#colorspace">colorspace</a></code>
      </td>
      <td>{{ HTMLElement("input") }}</td>
      <td>Xác định <a href="/en-US/docs/Glossary/Color_space">không gian màu</a> được sử dụng bởi input <code>type="color"</code>.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/textarea#cols">cols</a></code>
      </td>
      <td>{{ HTMLElement("textarea") }}</td>
      <td>Xác định số cột trong textarea.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/colspan">colspan</a></code>
      </td>
      <td>
        {{ HTMLElement("td") }}, {{ HTMLElement("th") }}
      </td>
      <td>
        Thuộc tính colspan xác định số cột mà một ô nên kéo dài.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/content">content</a></code>
      </td>
      <td>{{ HTMLElement("meta") }}</td>
      <td>
        Giá trị liên kết với <code>http-equiv</code> hoặc
        <code>name</code> tùy thuộc vào ngữ cảnh.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable">contenteditable</a></code>
      </td>
      <td>
        <a href="/en-US/docs/Web/HTML/Reference/Global_attributes">Thuộc tính toàn cục</a>
      </td>
      <td>Cho biết liệu nội dung của phần tử có thể chỉnh sửa không.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/controls">controls</a></code>
      </td>
      <td>
        {{ HTMLElement("audio") }},
        {{ HTMLElement("video") }}
      </td>
      <td>
        Cho biết liệu trình duyệt có nên hiển thị điều khiển phát lại cho người dùng không.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/area#coords">coords</a></code>
      </td>
      <td>{{ HTMLElement("area") }}</td>
      <td>
        Tập hợp các giá trị chỉ định tọa độ của vùng hot-spot.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/crossorigin">crossorigin</a></code>
      </td>
      <td>
        {{ HTMLElement("audio") }}, {{ HTMLElement("img") }},
        {{ HTMLElement("link") }}, {{ HTMLElement("script") }},
        {{ HTMLElement("video") }}
      </td>
      <td>Cách phần tử xử lý các yêu cầu cross-origin</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/API/HTMLIFrameElement/csp">csp</a></code>
        {{experimental_inline}}
      </td>
      <td>{{ HTMLElement("iframe") }}</td>
      <td>
        Chỉ định Content Security Policy mà tài liệu nhúng phải
        đồng ý thực thi.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/object#data">data</a></code>
      </td>
      <td>{{ HTMLElement("object") }}</td>
      <td>Chỉ định URL của tài nguyên.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Global_attributes/data-*">data-*</a></code>
      </td>
      <td>
        <a href="/en-US/docs/Web/HTML/Reference/Global_attributes">Thuộc tính toàn cục</a>
      </td>
      <td>Cho phép bạn gắn các thuộc tính tùy chỉnh vào phần tử HTML.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/datetime">datetime</a></code>
      </td>
      <td>
        {{ HTMLElement("del") }}, {{ HTMLElement("ins") }},
        {{ HTMLElement("time") }}
      </td>
      <td>Cho biết ngày và giờ liên kết với phần tử.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/img#decoding">decoding</a></code>
      </td>
      <td>{{ HTMLElement("img") }}</td>
      <td>Cho biết phương thức ưu tiên để giải mã hình ảnh.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/track#default">default</a></code>
      </td>
      <td>{{ HTMLElement("track") }}</td>
      <td>
        Cho biết rằng track nên được kích hoạt trừ khi tùy chọn của người dùng
        chỉ định điều khác.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/script#defer">defer</a></code>
      </td>
      <td>{{ HTMLElement("script") }}</td>
      <td>
        Cho biết rằng script nên được thực thi sau khi trang đã được
        phân tích cú pháp.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Global_attributes/dir">dir</a></code>
      </td>
      <td>
        <a href="/en-US/docs/Web/HTML/Reference/Global_attributes">Thuộc tính toàn cục</a>
      </td>
      <td>
        Xác định hướng văn bản. Các giá trị được phép là ltr (Left-To-Right) hoặc
        rtl (Right-To-Left)
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/dirname">dirname</a></code>
      </td>
      <td>
        {{ HTMLElement("input") }},
        {{ HTMLElement("textarea") }}
      </td>
      <td></td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/disabled">disabled</a></code>
      </td>
      <td>
        {{ HTMLElement("button") }},
        {{ HTMLElement("fieldset") }},
        {{ HTMLElement("input") }},
        {{ HTMLElement("optgroup") }},
        {{ HTMLElement("option") }},
        {{ HTMLElement("select") }},
        {{ HTMLElement("textarea") }}
      </td>
      <td>Cho biết liệu người dùng có thể tương tác với phần tử không.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/download">download</a></code>
      </td>
      <td>{{ HTMLElement("a") }}, {{ HTMLElement("area") }}</td>
      <td>
        Cho biết rằng siêu liên kết được sử dụng để tải xuống một tài nguyên.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Global_attributes/draggable">draggable</a></code>
      </td>
      <td>
        <a href="/en-US/docs/Web/HTML/Reference/Global_attributes">Thuộc tính toàn cục</a>
      </td>
      <td>Xác định liệu phần tử có thể kéo được không.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/form#enctype">enctype</a></code>
      </td>
      <td>{{ HTMLElement("form") }}</td>
      <td>
        Xác định kiểu nội dung của dữ liệu biểu mẫu khi
        <code>method</code> là POST.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Global_attributes/enterkeyhint">enterkeyhint</a></code>
      </td>
      <td>
        {{ HTMLElement("textarea") }},
        <a href="/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable"><code>contenteditable</code></a>
      </td>
      <td>
        <a href="https://html.spec.whatwg.org/multipage/interaction.html#input-modalities:-the-enterkeyhint-attribute"><code>enterkeyhint</code></a>
        chỉ định nhãn hành động (hoặc biểu tượng) cần hiển thị cho phím Enter trên
        bàn phím ảo. Thuộc tính có thể được sử dụng với các điều khiển biểu mẫu (chẳng hạn như
        giá trị của các phần tử <code>textarea</code>), hoặc trong các phần tử ở
        editing host (ví dụ: sử dụng thuộc tính <code>contenteditable</code>).
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/elementtiming">elementtiming</a></code>
      </td>
      <td>
        {{htmlelement("img")}},
        {{SVGElement("image")}} elements inside an {{SVGElement("svg")}},
        poster images of {{htmlelement("video")}} elements,
        elements which have a {{cssxref("background-image")}},
        and elements containing text nodes, such as a {{htmlelement("p")}}
      </td>
      <td>
        Cho biết rằng một phần tử được đánh dấu để theo dõi bởi các đối tượng {{domxref("PerformanceObserver")}} sử dụng loại <code>"element"</code>. Để biết thêm chi tiết, xem giao diện {{domxref("PerformanceElementTiming")}}.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/fetchpriority">fetchpriority</a></code>
      </td>
      <td>
        {{ HTMLElement("img") }},
        {{ HTMLElement("link") }},
        {{ HTMLElement("script") }}
      </td>
      <td>Báo hiệu rằng việc tải một hình ảnh cụ thể sớm trong quá trình tải có tác động nhiều hay ít đến trải nghiệm người dùng hơn so với những gì trình duyệt có thể suy ra hợp lý khi gán độ ưu tiên nội bộ.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/for">for</a></code>
      </td>
      <td>
        {{ HTMLElement("label") }},
        {{ HTMLElement("output") }}
      </td>
      <td>Mô tả các phần tử thuộc về phần tử này.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/form">form</a></code>
      </td>
      <td>
        {{ HTMLElement("button") }},
        {{ HTMLElement("fieldset") }},
        {{ HTMLElement("input") }},
        {{ HTMLElement("object") }},
        {{ HTMLElement("output") }},
        {{ HTMLElement("select") }},
        {{ HTMLElement("textarea") }}
      </td>
      <td>Cho biết biểu mẫu là chủ sở hữu của phần tử.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/formaction">formaction</a></code>
      </td>
      <td>
        {{ HTMLElement("input") }},
        {{ HTMLElement("button") }}
      </td>
      <td>
        Cho biết hành động của phần tử, ghi đè hành động được định nghĩa trong
        {{ HTMLElement("form") }}.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/formenctype">formenctype</a></code>
      </td>
      <td>
        {{ HTMLElement("button") }},
        {{ HTMLElement("input") }}
      </td>
      <td>
        Nếu button/input là {{Glossary("submit button")}} (ví dụ: <code>type="submit"</code>),
        thuộc tính này đặt kiểu mã hóa sử dụng khi gửi biểu mẫu. Nếu
        thuộc tính này được chỉ định, nó ghi đè thuộc tính
        <code>enctype</code> của <a href="/en-US/docs/Web/HTML/Reference/Elements/form">form</a> chủ sở hữu của button.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/formmethod">formmethod</a></code>
      </td>
      <td>
        {{ HTMLElement("button") }},
        {{ HTMLElement("input") }}
      </td>
      <td>
        Nếu button/input là {{Glossary("submit button")}} (ví dụ: <code>type="submit"</code>),
        thuộc tính này đặt phương thức gửi sử dụng khi gửi biểu mẫu
        (<code>GET</code>, <code>POST</code>, v.v.). Nếu thuộc tính này
        được chỉ định, nó ghi đè thuộc tính <code>method</code> của
        <a href="/en-US/docs/Web/HTML/Reference/Elements/form">form</a> chủ sở hữu của button.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/formnovalidate">formnovalidate</a></code>
      </td>
      <td>
        {{ HTMLElement("button") }},
        {{ HTMLElement("input") }}
      </td>
      <td>
        Nếu button/input là {{Glossary("submit button")}} (ví dụ: <code>type="submit"</code>),
        thuộc tính boolean này chỉ định rằng biểu mẫu không cần được xác thực
        khi gửi. Nếu thuộc tính này được chỉ định, nó ghi đè thuộc tính
        <code>novalidate</code> của <a href="/en-US/docs/Web/HTML/Reference/Elements/form">form</a> chủ sở hữu của button.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/formtarget">formtarget</a></code>
      </td>
      <td>
        {{ HTMLElement("button") }},
        {{ HTMLElement("input") }}
      </td>
      <td>
        Nếu button/input là {{Glossary("submit button")}} (ví dụ: <code>type="submit"</code>),
        thuộc tính này chỉ định ngữ cảnh duyệt web (ví dụ: tab, cửa sổ,
        hoặc khung nội tuyến) để hiển thị phản hồi nhận được sau khi
        gửi biểu mẫu. Nếu thuộc tính này được chỉ định, nó ghi đè thuộc tính
        <code>target</code> của <a href="/en-US/docs/Web/HTML/Reference/Elements/form">form</a> chủ sở hữu của button.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/headers">headers</a></code>
      </td>
      <td>
        {{ HTMLElement("td") }}, {{ HTMLElement("th") }}
      </td>
      <td>
        ID của các phần tử <code>&#x3C;th></code> áp dụng cho phần tử này.
      </td>
    </tr>
    <tr>
      <td><code>height</code></td>
      <td>
        {{ HTMLElement("canvas") }},
        {{ HTMLElement("embed") }},
        {{ HTMLElement("iframe") }}, {{ HTMLElement("img") }},
        {{ HTMLElement("input") }},
        {{ HTMLElement("object") }},
        {{ HTMLElement("video") }}
      </td>
      <td>
        <p>
          Chỉ định chiều cao của các phần tử được liệt kê ở đây. Với tất cả các phần tử khác,
          hãy sử dụng thuộc tính CSS {{cssxref("height")}}.
        </p>
        <div class="note notecard">
          <p>
            <strong>Lưu ý:</strong> Trong một số trường hợp, chẳng hạn như
            {{ HTMLElement("div") }}, đây là thuộc tính cũ, trong trường hợp đó
            nên sử dụng thuộc tính CSS {{ Cssxref("height") }} thay thế.
          </p>
        </div>
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Global_attributes/hidden">hidden</a></code>
      </td>
      <td>
        <a href="/en-US/docs/Web/HTML/Reference/Global_attributes">Thuộc tính toàn cục</a>
      </td>
      <td>
        Ngăn hiển thị phần tử đã cho, trong khi vẫn giữ các phần tử con, ví dụ
        các phần tử script, hoạt động.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/meter#high">high</a></code>
      </td>
      <td>{{ HTMLElement("meter") }}</td>
      <td>Cho biết giới hạn dưới của phạm vi trên.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/href">href</a></code>
      </td>
      <td>
        {{ HTMLElement("a") }}, {{ HTMLElement("area") }},
        {{ HTMLElement("base") }}, {{ HTMLElement("link") }}
      </td>
      <td>URL của tài nguyên được liên kết.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/hreflang">hreflang</a></code>
      </td>
      <td>
        {{ HTMLElement("a") }}, {{ HTMLElement("link") }}
      </td>
      <td>Chỉ định ngôn ngữ của tài nguyên được liên kết.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/meta/http-equiv">http-equiv</a></code>
      </td>
      <td>{{ HTMLElement("meta") }}</td>
      <td>Xác định chỉ thị pragma.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Global_attributes/id">id</a></code>
      </td>
      <td>
        <a href="/en-US/docs/Web/HTML/Reference/Global_attributes">Thuộc tính toàn cục</a>
      </td>
      <td>
        Thường được dùng với CSS để tạo kiểu cho một phần tử cụ thể. Giá trị của thuộc tính này phải là duy nhất.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/Security/Subresource_Integrity">integrity</a></code>
      </td>
      <td>
        {{ HTMLElement("link") }}, {{ HTMLElement("script") }}
      </td>
      <td>
        <p>
          Chỉ định giá trị
          <a href="/en-US/docs/Web/Security/Subresource_Integrity">Subresource Integrity</a>
          cho phép trình duyệt xác minh những gì chúng tải về.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <a href="/en-US/docs/Web/HTML/Reference/Global_attributes/inputmode"><code>inputmode</code></a>
      </td>
      <td>
        {{ HTMLElement("textarea") }},
        <a href="/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable"><code>contenteditable</code></a>
      </td>
      <td>
        Cung cấp gợi ý về kiểu dữ liệu có thể được nhập bởi người dùng
        khi chỉnh sửa phần tử hoặc nội dung của nó. Thuộc tính có thể được sử dụng
        với các điều khiển biểu mẫu (chẳng hạn như giá trị của
        các phần tử <code>textarea</code>), hoặc trong các phần tử ở editing host
        (ví dụ: sử dụng thuộc tính <code>contenteditable</code>).
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/img#ismap">ismap</a></code>
      </td>
      <td>{{ HTMLElement("img") }}</td>
      <td>Cho biết hình ảnh là một phần của bản đồ hình ảnh phía máy chủ.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Global_attributes/itemprop">itemprop</a></code>
      </td>
      <td>
        <a href="/en-US/docs/Web/HTML/Reference/Global_attributes">Thuộc tính toàn cục</a>
      </td>
      <td></td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/track#kind">kind</a></code>
      </td>
      <td>{{ HTMLElement("track") }}</td>
      <td>Chỉ định loại track văn bản.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/label">label</a></code>
      </td>
      <td>
        {{ HTMLElement("optgroup") }},
        {{ HTMLElement("option") }},
        {{ HTMLElement("track") }}
      </td>
      <td>Chỉ định tiêu đề có thể đọc được của phần tử.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Global_attributes/lang">lang</a></code>
      </td>
      <td>
        <a href="/en-US/docs/Web/HTML/Reference/Global_attributes">Thuộc tính toàn cục</a>
      </td>
      <td>Xác định ngôn ngữ được sử dụng trong phần tử.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/script#language">language</a></code>
        {{deprecated_inline}}
      </td>
      <td>{{ HTMLElement("script") }}</td>
      <td>Xác định ngôn ngữ script được sử dụng trong phần tử.</td>
    </tr>
    <tr>
      <td><code>loading</code></td>
      <td>
        {{ HTMLElement("img") }}, {{ HTMLElement("iframe") }}
      </td>
      <td>
        Cho biết nếu phần tử nên được tải lười biếng
        (<code>loading="lazy"</code>) hoặc tải ngay lập tức
        (<code>loading="eager"</code>).
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/input#list">list</a></code>
      </td>
      <td>{{ HTMLElement("input") }}</td>
      <td>Xác định danh sách các tùy chọn được định nghĩa trước để gợi ý cho người dùng.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/loop">loop</a></code>
      </td>
      <td>
        {{ HTMLElement("audio") }},
        {{ HTMLElement("marquee") }},
        {{ HTMLElement("video") }}
      </td>
      <td>
        Cho biết liệu phương tiện có nên bắt đầu phát lại từ đầu khi
        kết thúc không.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/meter#low">low</a></code>
      </td>
      <td>{{ HTMLElement("meter") }}</td>
      <td>Cho biết giới hạn trên của phạm vi dưới.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/max">max</a></code>
      </td>
      <td>
        {{ HTMLElement("input") }},
        {{ HTMLElement("meter") }},
        {{ HTMLElement("progress") }}
      </td>
      <td>Cho biết giá trị tối đa được phép.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/maxlength">maxlength</a></code>
      </td>
      <td>
        {{ HTMLElement("input") }},
        {{ HTMLElement("textarea") }}
      </td>
      <td>Xác định số ký tự tối đa được phép trong phần tử.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/minlength">minlength</a></code>
      </td>
      <td>
        {{ HTMLElement("input") }},
        {{ HTMLElement("textarea") }}
      </td>
      <td>Xác định số ký tự tối thiểu được phép trong phần tử.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/media">media</a></code>
      </td>
      <td>
        {{ HTMLElement("a") }}, {{ HTMLElement("area") }},
        {{ HTMLElement("link") }}, {{ HTMLElement("source") }},
        {{ HTMLElement("style") }}
      </td>
      <td>
        Chỉ định gợi ý về phương tiện mà tài nguyên được liên kết được thiết kế cho.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/form#method">method</a></code>
      </td>
      <td>{{ HTMLElement("form") }}</td>
      <td>
        Xác định phương thức <a href="/en-US/docs/Web/HTTP">HTTP</a> nào để sử dụng khi
        gửi biểu mẫu. Có thể là <code>GET</code> (mặc định) hoặc
        <code>POST</code>.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/min">min</a></code>
      </td>
      <td>
        {{ HTMLElement("input") }},
        {{ HTMLElement("meter") }}
      </td>
      <td>Cho biết giá trị tối thiểu được phép.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/multiple">multiple</a></code>
      </td>
      <td>
        {{ HTMLElement("input") }},
        {{ HTMLElement("select") }}
      </td>
      <td>
        Cho biết liệu có thể nhập nhiều giá trị trong một input kiểu
        <code>email</code> hoặc <code>file</code> không.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/muted">muted</a></code>
      </td>
      <td>
        {{ HTMLElement("audio") }},
        {{ HTMLElement("video") }}
      </td>
      <td>
        Cho biết liệu âm thanh có bị tắt ban đầu khi tải trang không.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/name">name</a></code>
      </td>
      <td>
        {{ HTMLElement("button") }}, {{ HTMLElement("form") }},
        {{ HTMLElement("fieldset") }},
        {{ HTMLElement("iframe") }},
        {{ HTMLElement("input") }},
        {{ HTMLElement("object") }},
        {{ HTMLElement("output") }},
        {{ HTMLElement("select") }},
        {{ HTMLElement("textarea") }},
        {{ HTMLElement("map") }}, {{ HTMLElement("meta") }},
        {{ HTMLElement("param") }}
      </td>
      <td>
        Tên của phần tử. Ví dụ được máy chủ sử dụng để xác định
        các trường trong biểu mẫu gửi.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/form#novalidate">novalidate</a></code>
      </td>
      <td>{{ HTMLElement("form") }}</td>
      <td>
        Thuộc tính này cho biết rằng biểu mẫu không nên được xác thực khi
        gửi.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/open">open</a></code>
      </td>
      <td>
        {{ HTMLElement("details") }},
        {{ HTMLElement("dialog") }}
      </td>
      <td>
        Cho biết liệu nội dung hiện có hiển thị không (trong trường hợp
        phần tử <code>&#x3C;details></code>) hoặc liệu hộp thoại có đang hoạt động
        và có thể tương tác không (trong trường hợp phần tử
        <code>&#x3C;dialog></code>).
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/meter#optimum">optimum</a></code>
      </td>
      <td>{{ HTMLElement("meter") }}</td>
      <td>Cho biết giá trị số tối ưu.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/pattern">pattern</a></code>
      </td>
      <td>{{ HTMLElement("input") }}</td>
      <td>
        Xác định biểu thức chính quy mà giá trị của phần tử sẽ được xác thực.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/a#ping">ping</a></code>
      </td>
      <td>{{ HTMLElement("a") }}, {{ HTMLElement("area") }}</td>
      <td>
        Thuộc tính <code>ping</code> chỉ định danh sách URL được phân tách bằng dấu cách
        để được thông báo nếu người dùng theo liên kết.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/placeholder">placeholder</a></code>
      </td>
      <td>
        {{ HTMLElement("input") }},
        {{ HTMLElement("textarea") }}
      </td>
      <td>Cung cấp gợi ý cho người dùng về những gì có thể nhập vào trường.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/video#playsinline">playsinline</a></code>
      </td>
      <td>
        {{ HTMLElement("video") }}
      </td>
      <td>Thuộc tính Boolean cho biết rằng video sẽ được phát "inline"; nghĩa là, trong vùng phát lại của phần tử. Lưu ý rằng việc thiếu thuộc tính này không có nghĩa là video sẽ luôn được phát toàn màn hình.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/video#poster">poster</a></code>
      </td>
      <td>{{ HTMLElement("video") }}</td>
      <td>
        URL chỉ định khung poster hiển thị cho đến khi người dùng phát hoặc tua.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/preload">preload</a></code>
      </td>
      <td>
        {{ HTMLElement("audio") }},
        {{ HTMLElement("video") }}
      </td>
      <td>
        Cho biết liệu toàn bộ tài nguyên, một phần hoặc không có gì nên được
        tải trước.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/readonly">readonly</a></code>
      </td>
      <td>
        {{ HTMLElement("input") }},
        {{ HTMLElement("textarea") }}
      </td>
      <td>Cho biết liệu phần tử có thể chỉnh sửa không.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/referralpolicy">referrerpolicy</a></code>
      </td>
      <td>
        {{ HTMLElement("a") }}, {{ HTMLElement("area") }},
        {{ HTMLElement("iframe") }}, {{ HTMLElement("img") }},
        {{ HTMLElement("link") }}, {{ HTMLElement("script") }}
      </td>
      <td>Chỉ định referrer nào được gửi khi tải tài nguyên.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/rel">rel</a></code>
      </td>
      <td>
        {{ HTMLElement("a") }}, {{ HTMLElement("area") }},
        {{ HTMLElement("link") }}
      </td>
      <td>
        Chỉ định mối quan hệ của đối tượng đích với đối tượng liên kết.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/required">required</a></code>
      </td>
      <td>
        {{ HTMLElement("input") }},
        {{ HTMLElement("select") }},
        {{ HTMLElement("textarea") }}
      </td>
      <td>Cho biết liệu phần tử này có bắt buộc phải điền hay không.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/ol#reversed">reversed</a></code>
      </td>
      <td>{{ HTMLElement("ol") }}</td>
      <td>
        Cho biết liệu danh sách có nên hiển thị theo thứ tự giảm dần
        thay vì tăng dần không.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles">role</a></code>
      </td>
      <td><a href="/en-US/docs/Web/HTML/Reference/Global_attributes">Thuộc tính toàn cục</a></td>
      <td>Xác định vai trò rõ ràng cho một phần tử để các công nghệ hỗ trợ sử dụng.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/textarea#rows">rows</a></code>
      </td>
      <td>{{ HTMLElement("textarea") }}</td>
      <td>Xác định số hàng trong vùng văn bản.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/rowspan">rowspan</a></code>
      </td>
      <td>
        {{ HTMLElement("td") }}, {{ HTMLElement("th") }}
      </td>
      <td>Xác định số hàng mà một ô bảng nên kéo dài qua.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/iframe#sandbox">sandbox</a></code>
      </td>
      <td>{{ HTMLElement("iframe") }}</td>
      <td>
        Ngăn tài liệu được tải trong iframe sử dụng một số tính năng nhất định (chẳng hạn
        như gửi biểu mẫu hoặc mở cửa sổ mới).
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/th#scope">scope</a></code>
      </td>
      <td>{{ HTMLElement("th") }}</td>
      <td>
        Xác định các ô mà tiêu đề (được định nghĩa trong phần tử
        <code>th</code>) liên quan đến.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/option#selected">selected</a></code>
      </td>
      <td>{{ HTMLElement("option") }}</td>
      <td>Xác định một giá trị sẽ được chọn khi tải trang.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/shape">shape</a></code>
      </td>
      <td>{{ HTMLElement("a") }}, {{ HTMLElement("area") }}</td>
      <td></td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/size">size</a></code>
      </td>
      <td>
        {{ HTMLElement("input") }},
        {{ HTMLElement("select") }}
      </td>
      <td>
        Xác định chiều rộng của phần tử (tính bằng pixel). Nếu thuộc tính
        <code>type</code> của phần tử là <code>text</code> hoặc
        <code>password</code> thì đó là số ký tự.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/sizes">sizes</a></code>
      </td>
      <td>
        {{ HTMLElement("link") }}, {{ HTMLElement("img") }},
        {{ HTMLElement("source") }}
      </td>
      <td></td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Global_attributes/slot">slot</a></code>
      </td>
      <td>
        <a href="/en-US/docs/Web/HTML/Reference/Global_attributes">Thuộc tính toàn cục</a>
      </td>
      <td>Gán một slot trong cây shadow DOM cho một phần tử.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/span">span</a></code>
      </td>
      <td>
        {{ HTMLElement("col") }},
        {{ HTMLElement("colgroup") }}
      </td>
      <td></td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Global_attributes/spellcheck">spellcheck</a></code>
      </td>
      <td>
        <a href="/en-US/docs/Web/HTML/Reference/Global_attributes">Thuộc tính toàn cục</a>
      </td>
      <td>Cho biết liệu kiểm tra chính tả có được phép cho phần tử không.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/src">src</a></code>
      </td>
      <td>
        {{ HTMLElement("audio") }},
        {{ HTMLElement("embed") }},
        {{ HTMLElement("iframe") }}, {{ HTMLElement("img") }},
        {{ HTMLElement("input") }},
        {{ HTMLElement("script") }},
        {{ HTMLElement("source") }},
        {{ HTMLElement("track") }},
        {{ HTMLElement("video") }}
      </td>
      <td>URL của nội dung có thể nhúng.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/iframe#srcdoc">srcdoc</a></code>
      </td>
      <td>{{ HTMLElement("iframe") }}</td>
      <td></td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/track#srclang">srclang</a></code>
      </td>
      <td>{{ HTMLElement("track") }}</td>
      <td></td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/srcset">srcset</a></code>
      </td>
      <td>
        {{ HTMLElement("img") }}, {{ HTMLElement("source") }}
      </td>
      <td>Một hoặc nhiều ứng viên hình ảnh responsive.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/ol#start">start</a></code>
      </td>
      <td>{{ HTMLElement("ol") }}</td>
      <td>Xác định số đầu tiên nếu khác 1.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/step">step</a></code>
      </td>
      <td>{{ HTMLElement("input") }}</td>
      <td></td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Global_attributes/style">style</a></code>
      </td>
      <td>
        <a href="/en-US/docs/Web/HTML/Reference/Global_attributes">Thuộc tính toàn cục</a>
      </td>
      <td>Xác định các kiểu CSS sẽ ghi đè các kiểu đã đặt trước đó.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/table#summary">summary</a></code>
        {{deprecated_inline}}
      </td>
      <td>{{ HTMLElement("table") }}</td>
      <td></td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex">tabindex</a></code>
      </td>
      <td>
        <a href="/en-US/docs/Web/HTML/Reference/Global_attributes">Thuộc tính toàn cục</a>
      </td>
      <td>
        Ghi đè thứ tự tab mặc định của trình duyệt và theo thứ tự được chỉ định.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/target">target</a></code>
      </td>
      <td>
        {{ HTMLElement("a") }}, {{ HTMLElement("area") }},
        {{ HTMLElement("base") }}, {{ HTMLElement("form") }}
      </td>
      <td>
        Chỉ định nơi mở tài liệu được liên kết (trong trường hợp phần tử
        <code>&#x3C;a></code>) hoặc nơi hiển thị phản hồi nhận được
        (trong trường hợp phần tử <code>&#x3C;form></code>)
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Global_attributes/title">title</a></code>
      </td>
      <td>
        <a href="/en-US/docs/Web/HTML/Reference/Global_attributes">Thuộc tính toàn cục</a>
      </td>
      <td>Văn bản hiển thị trong tooltip khi di chuột qua phần tử.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Global_attributes/translate">translate</a></code>
      </td>
      <td>
        <a href="/en-US/docs/Web/HTML/Reference/Global_attributes">Thuộc tính toàn cục</a>
      </td>
      <td>
        Chỉ định liệu các giá trị thuộc tính của một phần tử và các giá trị của các nút
        <code><a href="https://dom.spec.whatwg.org/#text">Text</a></code> con của nó có được dịch khi trang được bản địa hóa hay không, hoặc để nguyên không thay đổi.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/type">type</a></code>
      </td>
      <td>
        {{ HTMLElement("button") }},
        {{ HTMLElement("input") }},
        {{ HTMLElement("embed") }},
        {{ HTMLElement("object") }},
        {{ HTMLElement("ol") }},
        {{ HTMLElement("script") }},
        {{ HTMLElement("source") }},
        {{ HTMLElement("style") }}, {{ HTMLElement("menu") }},
        {{ HTMLElement("link") }}
      </td>
      <td>Xác định kiểu của phần tử.</td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/usemap">usemap</a></code>
      </td>
      <td>
        {{ HTMLElement("img") }}, {{ HTMLElement("input") }},
        {{ HTMLElement("object") }}
      </td>
      <td></td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/value">value</a></code>
      </td>
      <td>
        {{ HTMLElement("button") }}, {{ HTMLElement("data") }},
        {{ HTMLElement("input") }}, {{ HTMLElement("li") }},
        {{ HTMLElement("meter") }},
        {{ HTMLElement("option") }},
        {{ HTMLElement("progress") }},
        {{ HTMLElement("param") }}
      </td>
      <td>
        Xác định giá trị mặc định sẽ hiển thị trong phần tử khi tải trang.
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/width">width</a></code>
      </td>
      <td>
        {{ HTMLElement("canvas") }},
        {{ HTMLElement("embed") }},
        {{ HTMLElement("iframe") }}, {{ HTMLElement("img") }},
        {{ HTMLElement("input") }},
        {{ HTMLElement("object") }},
        {{ HTMLElement("video") }}
      </td>
      <td>
        <p>
          Đối với các phần tử được liệt kê ở đây, thuộc tính này thiết lập chiều rộng của phần tử.
        </p>
        <div class="note notecard">
          <p>
            <strong>Lưu ý:</strong> Đối với tất cả các trường hợp khác, chẳng hạn như
            {{ HTMLElement("div") }}, đây là thuộc tính cũ, trong trường hợp đó
            nên sử dụng thuộc tính CSS {{ Cssxref("width") }} thay thế.
          </p>
        </div>
      </td>
    </tr>
    <tr>
      <td>
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/textarea#wrap">wrap</a></code>
      </td>
      <td>{{ HTMLElement("textarea") }}</td>
      <td>Cho biết liệu văn bản có nên được xuống dòng không.</td>
    </tr>
  </tbody>
</table>

## Thuộc tính nội dung và thuộc tính IDL

Trong HTML, hầu hết các thuộc tính có hai mặt: **thuộc tính nội dung** (content attribute) và **thuộc tính IDL (Interface Definition Language)**.

Thuộc tính nội dung là thuộc tính bạn đặt từ nội dung (mã HTML) và bạn có thể đặt hoặc lấy qua {{domxref("element.setAttribute()")}} hoặc {{domxref("element.getAttribute()")}}. Thuộc tính nội dung luôn là chuỗi ngay cả khi giá trị mong đợi phải là số nguyên. Ví dụ, để đặt `maxlength` của phần tử {{HTMLElement("input")}} thành 42 bằng thuộc tính nội dung, bạn phải gọi `setAttribute("maxlength", "42")` trên phần tử đó.

Thuộc tính IDL còn được gọi là thuộc tính JavaScript. Đây là những thuộc tính bạn có thể đọc hoặc đặt bằng cách sử dụng các thuộc tính JavaScript như `element.foo`. Thuộc tính IDL luôn sử dụng (nhưng có thể chuyển đổi) thuộc tính nội dung cơ bản để trả về giá trị khi bạn lấy nó và sẽ lưu thứ gì đó vào thuộc tính nội dung khi bạn đặt nó. Nói cách khác, các thuộc tính IDL, về bản chất, phản ánh các thuộc tính nội dung.

Hầu hết thời gian, các thuộc tính IDL sẽ trả về giá trị của chúng như chúng thực sự được sử dụng. Ví dụ, `type` mặc định cho các phần tử {{HTMLElement("input")}} là "text", vì vậy nếu bạn đặt `input.type="foobar"`, phần tử `<input>` sẽ thuộc kiểu text (trong giao diện và hành vi) nhưng giá trị của thuộc tính nội dung "type" sẽ là "foobar". Tuy nhiên, thuộc tính IDL `type` sẽ trả về chuỗi "text".

Các thuộc tính IDL không phải lúc nào cũng là chuỗi; ví dụ, `input.maxlength` là một số (signed long). Khi sử dụng các thuộc tính IDL, bạn đọc hoặc đặt các giá trị kiểu mong muốn, vì vậy `input.maxlength` luôn trả về một số và khi bạn đặt `input.maxlength`, nó muốn một số. Nếu bạn truyền kiểu khác, nó sẽ tự động chuyển đổi thành số theo các quy tắc JavaScript tiêu chuẩn cho việc chuyển đổi kiểu.

Các thuộc tính IDL có thể [phản ánh các kiểu khác](https://html.spec.whatwg.org/multipage/urls-and-fetching.html) như unsigned long, URL, boolean, v.v. Thật không may, không có quy tắc rõ ràng và cách các thuộc tính IDL hành xử kết hợp với các thuộc tính nội dung tương ứng của chúng tùy thuộc vào thuộc tính. Hầu hết thời gian, nó sẽ tuân theo [các quy tắc được đặt ra trong đặc tả](https://html.spec.whatwg.org/multipage/urls-and-fetching.html), nhưng đôi khi không. Các đặc tả HTML cố gắng làm cho điều này thân thiện với nhà phát triển nhất có thể, nhưng vì nhiều lý do (chủ yếu là lịch sử), một số thuộc tính hành xử kỳ lạ (`select.size`, ví dụ) và bạn nên đọc các đặc tả để hiểu chính xác cách chúng hành xử.

## Thuộc tính Boolean

Một số thuộc tính nội dung (ví dụ: `required`, `readonly`, `disabled`) được gọi là [thuộc tính boolean](https://html.spec.whatwg.org/multipage/common-microsyntaxes.html#boolean-attributes). Nếu thuộc tính boolean có mặt, giá trị của nó là **true**, và nếu vắng mặt, giá trị của nó là **false**.

HTML xác định các hạn chế về các giá trị được phép của thuộc tính boolean: Nếu thuộc tính có mặt, giá trị của nó phải là chuỗi rỗng (tương đương, thuộc tính có thể không có giá trị được gán), hoặc một giá trị là khớp không phân biệt hoa thường ASCII với tên chính tắc của thuộc tính, không có khoảng trắng đầu hoặc cuối. Các ví dụ sau là các cách hợp lệ để đánh dấu một thuộc tính boolean:

```html-nolint
<div itemscope>This is valid HTML but invalid XML.</div>
<div itemscope=itemscope>This is also valid HTML but invalid XML.</div>
<div itemscope="">This is valid HTML and also valid XML.</div>
<div itemscope="itemscope">
  This is also valid HTML and XML, but perhaps a bit verbose.
</div>
```

Để rõ ràng, các giá trị `"true"` và `"false"` không được phép trên các thuộc tính boolean. Để biểu thị giá trị false, thuộc tính phải được bỏ qua hoàn toàn. Hạn chế này làm rõ một số hiểu lầm phổ biến: Với `checked="false"` chẳng hạn, thuộc tính `checked` của phần tử sẽ được hiểu là **true** vì thuộc tính có mặt.

## Thuộc tính xử lý sự kiện

> [!WARNING]
> Việc sử dụng các thuộc tính nội dung xử lý sự kiện không được khuyến khích. Sự pha trộn giữa HTML và JavaScript thường tạo ra mã khó bảo trì, và việc thực thi các thuộc tính xử lý sự kiện cũng có thể bị chặn bởi các chính sách bảo mật nội dung.

> [!WARNING]
> Mặc dù không hiển thị khi gọi phương thức `Function.prototype.toString()` trên handler, các thuộc tính xử lý sự kiện sẽ ẩn bọc code bên trong 2 câu lệnh `with`, và có thể tạo ra kết quả không mong đợi. Ví dụ:
>
> ```html
> <div onclick="console.log(new URL(location))">Bad Example</div>
> ```
>
> Về cơ bản trở thành:
>
> ```js example-bad
> function onclick(event) {
>   with (this.ownerDocument) {
>     with (this) {
>       console.log(new URL(location)); // 'URL' now resolves to document.URL instead of window.URL
>       // TypeError: URL is not a constructor
>     }
>   }
> }
> ```

Ngoài các thuộc tính được liệt kê trong bảng trên, các [xử lý sự kiện](/en-US/docs/Web/API/Document_Object_Model/Events#using_onevent_properties) toàn cục — chẳng hạn như [`onclick`](/en-US/docs/Web/API/Element/click_event) — cũng có thể được chỉ định như [thuộc tính nội dung](#content_versus_idl_attributes) trên tất cả các phần tử.

Tất cả các thuộc tính xử lý sự kiện chấp nhận một chuỗi. Chuỗi này sẽ được sử dụng để tổng hợp một [hàm JavaScript](/en-US/docs/Web/JavaScript/Reference/Functions) như `function name(/*args*/) {body}`, trong đó `name` là tên của thuộc tính và `body` là giá trị của thuộc tính. Handler nhận cùng các tham số như đối tác xử lý sự kiện JavaScript của nó — hầu hết các handler chỉ nhận một tham số `event`, trong khi `onerror` nhận năm tham số: `event`, `source`, `lineno`, `colno`, `error`. Điều này có nghĩa là bạn có thể, nói chung, sử dụng biến `event` bên trong thuộc tính.

```html
<div onclick="console.log(event)">Click me!</div>
<!-- The synthesized handler has a name; you can reference itself -->
<div onclick="console.log(onclick)">Click me!</div>
```

## Xem thêm

- [Các phần tử HTML](/en-US/docs/Web/HTML/Reference/Elements)
