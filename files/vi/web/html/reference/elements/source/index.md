---
title: "<source>: Phần tử Nguồn Media hoặc Hình ảnh"
slug: Web/HTML/Reference/Elements/source
page-type: html-element
browser-compat: html.elements.source
sidebar: htmlsidebar
---

Phần tử **`<source>`** [HTML](/en-US/docs/Web/HTML) chỉ định một hoặc nhiều tài nguyên media cho các phần tử {{HTMLElement("picture")}}, {{HTMLElement("audio")}}, và {{HTMLElement("video")}}. Đây là {{glossary("void element")}}, nghĩa là nó không có nội dung và không yêu cầu thẻ đóng. Phần tử này thường được sử dụng để cung cấp cùng nội dung media ở nhiều định dạng tệp nhằm đảm bảo tương thích với nhiều trình duyệt, vì chúng có hỗ trợ khác nhau cho [các định dạng tệp hình ảnh](/en-US/docs/Web/Media/Guides/Formats/Image_types) và [các định dạng tệp media](/en-US/docs/Web/Media/Guides/Formats).

{{InteractiveExample("HTML Demo: &lt;source&gt;", "tabbed-standard")}}

```html interactive-example
<video controls width="250" height="200" muted>
  <source src="/shared-assets/videos/flower.webm" type="video/webm" />
  <source src="/shared-assets/videos/flower.mp4" type="video/mp4" />
  Download the
  <a href="/shared-assets/videos/flower.webm">WEBM</a>
  or
  <a href="/shared-assets/videos/flower.mp4">MP4</a>
  video.
</video>
```

## Thuộc tính

Phần tử này hỗ trợ tất cả [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes). Ngoài ra, các thuộc tính sau có thể được sử dụng với nó:

- `type`
  - : Chỉ định [loại MIME media của hình ảnh](/en-US/docs/Web/Media/Guides/Formats/Image_types) hoặc [loại media khác](/en-US/docs/Web/Media/Guides/Formats/Containers), tùy chọn bao gồm [tham số `codecs`](/en-US/docs/Web/Media/Guides/Formats/codecs_parameter).

- `src`
  - : Chỉ định URL của tài nguyên media. Bắt buộc nếu cha của `<source>` là {{HTMLElement("audio")}} hoặc {{HTMLElement("video")}}. Không được phép nếu cha là {{HTMLElement("picture")}}.

- `srcset`
  - : Chỉ định danh sách được phân tách bằng dấu phẩy của một hoặc nhiều URL hình ảnh và mô tả của chúng. Bắt buộc nếu cha của `<source>` là {{HTMLElement("picture")}}. Không được phép nếu cha là {{HTMLElement("audio")}} hoặc {{HTMLElement("video")}}.

    Danh sách bao gồm các chuỗi được phân tách bằng dấu phẩy, chỉ định một tập hợp các hình ảnh có thể để trình duyệt sử dụng. Mỗi chuỗi bao gồm:
    - URL chỉ định vị trí hình ảnh.
    - Mô tả chiều rộng tùy chọn — một số nguyên dương theo sau trực tiếp bởi `"w"`, chẳng hạn `300w`.
    - Mô tả mật độ pixel tùy chọn — một số thực dương theo sau trực tiếp bởi `"x"`, chẳng hạn `2x`.

    Mỗi chuỗi trong danh sách phải có mô tả chiều rộng hoặc mô tả mật độ pixel để hợp lệ. Hai mô tả này không nên được sử dụng cùng nhau; chỉ nên sử dụng một trong số chúng một cách nhất quán trong toàn bộ danh sách. Giá trị của mỗi mô tả trong danh sách phải là duy nhất. Trình duyệt chọn hình ảnh phù hợp nhất để hiển thị tại một thời điểm nhất định dựa trên các mô tả này. Nếu các mô tả không được chỉ định, giá trị mặc định được sử dụng là `1x`. Nếu thuộc tính `sizes` cũng có mặt, thì mỗi chuỗi phải bao gồm mô tả chiều rộng. Nếu trình duyệt không hỗ trợ `srcset`, thì `src` sẽ được sử dụng cho nguồn hình ảnh mặc định.

- `sizes`
  - : Chỉ định danh sách kích thước nguồn mô tả chiều rộng hiển thị cuối cùng của hình ảnh. Được phép nếu cha của `<source>` là {{HTMLElement("picture")}}. Không được phép nếu cha là {{HTMLElement("audio")}} hoặc {{HTMLElement("video")}}.

    Danh sách bao gồm các kích thước nguồn được phân tách bằng dấu phẩy. Mỗi kích thước nguồn là cặp điều kiện media-chiều dài. Trước khi bố cục trang, trình duyệt sử dụng thông tin này để xác định hình ảnh nào được định nghĩa trong [`srcset`](#srcset) để hiển thị. Lưu ý rằng `sizes` sẽ chỉ có hiệu lực nếu mô tả chiều rộng được cung cấp với `srcset`, không phải mô tả mật độ pixel (tức là, `200w` nên được sử dụng thay vì `2x`).

- `media`
  - : Chỉ định [truy vấn media](/en-US/docs/Web/CSS/Guides/Media_queries) cho media dự định của tài nguyên.

- `height`
  - : Chỉ định chiều cao nội tại của hình ảnh tính bằng pixel. Được phép nếu cha của `<source>` là {{HTMLElement("picture")}}. Không được phép nếu cha là {{HTMLElement("audio")}} hoặc {{HTMLElement("video")}}.

    Giá trị chiều cao phải là số nguyên không có đơn vị.

- `width`
  - : Chỉ định chiều rộng nội tại của hình ảnh tính bằng pixel. Được phép nếu cha của `<source>` là {{HTMLElement("picture")}}. Không được phép nếu cha là {{HTMLElement("audio")}} hoặc {{HTMLElement("video")}}.

    Giá trị chiều rộng phải là số nguyên không có đơn vị.

## Ghi chú sử dụng

Phần tử `<source>` là **{{glossary("void element")}}**, nghĩa là nó không chỉ không có nội dung mà còn không có thẻ đóng. Nghĩa là bạn _không bao giờ_ sử dụng `</source>` trong HTML của bạn.

Trình duyệt duyệt qua danh sách các phần tử `<source>` để tìm định dạng mà nó hỗ trợ. Nó sử dụng cái đầu tiên mà nó có thể hiển thị. Đối với mỗi phần tử `<source>`:

- Nếu thuộc tính `type` không được chỉ định, trình duyệt truy xuất loại media từ máy chủ và xác định xem có thể hiển thị không. Nếu không thể hiển thị media, trình duyệt kiểm tra `<source>` tiếp theo trong danh sách.
- Nếu thuộc tính `type` được chỉ định, trình duyệt ngay lập tức so sánh nó với các loại media mà nó có thể hiển thị. Nếu loại không được hỗ trợ, trình duyệt bỏ qua việc truy vấn máy chủ và trực tiếp kiểm tra phần tử `<source>` tiếp theo.

Nếu không có phần tử `<source>` nào cung cấp nguồn có thể sử dụng:

- Trong trường hợp phần tử `<picture>`, trình duyệt sẽ dùng dự phòng hình ảnh được chỉ định trong phần tử con {{HTMLElement("img")}} của `<picture>`.
- Trong trường hợp phần tử `<audio>` hoặc `<video>`, trình duyệt sẽ dùng dự phòng hiển thị nội dung được bao gồm giữa thẻ mở và đóng của phần tử.

Để biết thông tin về các định dạng hình ảnh được trình duyệt web hỗ trợ và hướng dẫn lựa chọn định dạng phù hợp, xem [Hướng dẫn về loại và định dạng tệp hình ảnh](/en-US/docs/Web/Media/Guides/Formats/Image_types). Để biết chi tiết về các loại media video và âm thanh bạn có thể sử dụng, xem [Hướng dẫn về loại và định dạng media](/en-US/docs/Web/Media/Guides/Formats).

## Ví dụ

### Sử dụng thuộc tính `type` với `<video>`

Ví dụ này minh họa cách cung cấp video ở các định dạng khác nhau: WebM cho các trình duyệt hỗ trợ nó, Ogg cho những trình duyệt hỗ trợ Ogg, và QuickTime cho các trình duyệt hỗ trợ QuickTime. Nếu phần tử `<audio>` hoặc `<video>` không được trình duyệt hỗ trợ, một thông báo được hiển thị thay thế. Nếu trình duyệt hỗ trợ phần tử nhưng không hỗ trợ bất kỳ định dạng nào được chỉ định, sự kiện `error` được phát sinh trên phần tử `<audio>` hoặc `<video>` và các điều khiển media mặc định (nếu được bật) sẽ chỉ ra lỗi. Để biết thêm chi tiết về các định dạng tệp media nào cần sử dụng và hỗ trợ trình duyệt của chúng, tham khảo [Hướng dẫn về loại và định dạng media](/en-US/docs/Web/Media/Guides/Formats).

```html
<video controls>
  <source src="foo.webm" type="video/webm" />
  <source src="foo.ogg" type="video/ogg" />
  <source src="foo.mov" type="video/quicktime" />
  I'm sorry; your browser doesn't support HTML video.
</video>
```

### Sử dụng thuộc tính `media` với `<video>`

Ví dụ này minh họa cách cung cấp tệp nguồn thay thế cho các vùng hiển thị có chiều rộng trên một giá trị nhất định. Khi môi trường duyệt web của người dùng đáp ứng điều kiện `media` được chỉ định, phần tử `<source>` liên quan được chọn. Sau đó, nội dung thuộc tính `src` của nó được yêu cầu và hiển thị. Nếu điều kiện `media` không khớp, trình duyệt sẽ chuyển sang `<source>` tiếp theo trong danh sách. Tùy chọn `<source>` thứ hai trong mã dưới đây không có điều kiện `media`, vì vậy nó sẽ được chọn cho tất cả các ngữ cảnh duyệt khác.

```html
<video controls>
  <source src="foo-large.webm" media="(width >= 800px)" />
  <source src="foo.webm" />
  I'm sorry; your browser doesn't support HTML video.
</video>
```

Để biết thêm ví dụ, bài viết [Video và âm thanh HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_video_and_audio) trong khu vực Học tập là tài nguyên tuyệt vời.

### Sử dụng thuộc tính `media` với `<picture>`

Trong ví dụ này, hai phần tử `<source>` được bao gồm trong {{HTMLElement("picture")}}, cung cấp các phiên bản hình ảnh để sử dụng khi không gian có sẵn vượt quá các chiều rộng nhất định. Nếu chiều rộng có sẵn nhỏ hơn chiều rộng nhỏ nhất trong số các chiều rộng này, trình duyệt sẽ dùng dự phòng hình ảnh được chỉ định trong phần tử {{HTMLElement("img")}}.

```html
<picture>
  <source srcset="mdn-logo-wide.png" media="(width >= 800px)" />
  <source srcset="mdn-logo-medium.png" media="(width >= 600px)" />
  <img src="mdn-logo-narrow.png" alt="MDN Web Docs" />
</picture>
```

Với phần tử `<picture>`, bạn phải luôn bao gồm `<img>` với hình ảnh dự phòng. Ngoài ra, hãy đảm bảo thêm thuộc tính `alt` cho khả năng tiếp cận, trừ khi hình ảnh thuần túy là trang trí và không liên quan đến nội dung.

### Sử dụng thuộc tính `height` và `width` với `<picture>`

Trong ví dụ này, ba phần tử `<source>` với thuộc tính `height` và `width` được bao gồm trong phần tử {{HTMLElement("picture")}}.
[Truy vấn media](/en-US/docs/Web/CSS/Guides/Media_queries/Using) cho phép trình duyệt chọn hình ảnh để hiển thị với các thuộc tính `height` và `width` dựa trên kích thước [vùng hiển thị](/en-US/docs/Glossary/Viewport).

```html
<picture>
  <source
    srcset="landscape.png"
    media="(width >= 1000px)"
    width="1000"
    height="400" />
  <source
    srcset="square.png"
    media="(width >= 800px)"
    width="800"
    height="800" />
  <source
    srcset="portrait.png"
    media="(width >= 600px)"
    width="600"
    height="800" />
  <img
    src="fallback.png"
    alt="Image used when the browser does not support the sources"
    width="500"
    height="400" />
</picture>
```

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>Không có.</td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>Không có; đây là một {{Glossary("void element")}}.</td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Phải có thẻ mở và không được có thẻ đóng.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        <div>
          Phần tử media — {{HTMLElement("audio")}} hoặc
          {{HTMLElement("video")}} — và phải được đặt trước bất kỳ
          <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
            >nội dung luồng</a
          >
          hoặc phần tử {{HTMLElement("track")}}.
        </div>
        <div>
          Phần tử {{HTMLElement("picture")}}, và phải được đặt
          trước phần tử {{HTMLElement("img")}}.
        </div>
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <a href="https://w3c.github.io/html-aria/#dfn-no-corresponding-role"
          >Không có vai trò tương ứng</a
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Không có <code>role</code> được phép</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLSourceElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử {{HTMLElement("audio")}}
- Phần tử {{HTMLElement("picture")}}
- Phần tử {{HTMLElement("video")}}
- [Hướng dẫn về loại và định dạng tệp hình ảnh](/en-US/docs/Web/Media/Guides/Formats/Image_types)
- [Hướng dẫn về loại và định dạng media](/en-US/docs/Web/Media/Guides/Formats)
- [Hiệu năng web](/en-US/docs/Learn_web_development/Extensions/Performance)
