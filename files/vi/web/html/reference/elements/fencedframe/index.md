---
title: "<fencedframe>: Phần tử Fenced Frame"
slug: Web/HTML/Reference/Elements/fencedframe
page-type: html-element
status:
  - experimental
browser-compat: html.elements.fencedframe
sidebar: htmlsidebar
---

{{SeeCompatTable}}

Phần tử **`<fencedframe>`** trong [HTML](/vi/docs/Web/HTML) biểu diễn một {{Glossary("browsing context")}} lồng nhau, nhúng một trang HTML khác vào trang hiện tại. `<fencedframe>` rất giống với các phần tử {{htmlelement("iframe")}} về hình thức và chức năng, ngoại trừ:

- Giao tiếp bị hạn chế giữa nội dung `<fencedframe>` và trang nhúng nó.
- Một `<fencedframe>` có thể truy cập dữ liệu đa nguồn gốc, nhưng chỉ trong một tập hợp các hoàn cảnh được kiểm soát rất cụ thể nhằm bảo vệ quyền riêng tư của người dùng.
- Một `<fencedframe>` không thể bị thao túng hay có dữ liệu của nó được truy cập qua các script thông thường (ví dụ đọc hoặc đặt URL nguồn). Nội dung `<fencedframe>` chỉ có thể được nhúng thông qua [các API cụ thể](/vi/docs/Web/API/Fenced_frame_API#use_cases).
- Một `<fencedframe>` không thể truy cập DOM của ngữ cảnh nhúng, cũng như ngữ cảnh nhúng không thể truy cập DOM của `<fencedframe>`.

Phần tử `<fencedframe>` là một loại `<iframe>` với nhiều tính năng riêng tư gốc được tích hợp. Nó giải quyết các hạn chế của `<iframe>` như phụ thuộc vào cookie bên thứ ba và các rủi ro về quyền riêng tư khác. Xem [Fenced frame API](/vi/docs/Web/API/Fenced_frame_API) để biết thêm chi tiết.

## Thuộc tính

Phần tử này bao gồm [các thuộc tính toàn cục](/vi/docs/Web/HTML/Reference/Global_attributes).

- `allow` {{experimental_inline}}
  - : Chỉ định một [Permissions Policy](/vi/docs/Web/HTTP/Guides/Permissions_Policy) cho `<fencedframe>`, xác định các tính năng nào có sẵn cho `<fencedframe>` dựa trên nguồn gốc của yêu cầu. Xem [Chính sách quyền có sẵn cho fenced frames](#permissions_policies_available_to_fenced_frames) để biết thêm chi tiết về các tính năng nào có thể được kiểm soát thông qua chính sách đặt trên fenced frame.

- `height` {{experimental_inline}}
  - : Một số nguyên không có đơn vị biểu diễn chiều cao của fenced frame tính bằng pixel CSS. Mặc định là `150`.

- `width` {{experimental_inline}}
  - : Một số nguyên không có đơn vị biểu diễn chiều rộng của fenced frame tính bằng pixel CSS. Mặc định là `300`.

## Chính sách quyền có sẵn cho fenced frames

Các quyền được ủy quyền từ ngữ cảnh cấp cao nhất đến fenced frame để cho phép hoặc từ chối các tính năng có thể được sử dụng như kênh liên lạc, do đó tạo thành mối đe dọa về quyền riêng tư. Kết quả là, các tính năng web tiêu chuẩn mà tính khả dụng của chúng có thể được kiểm soát qua [Permissions Policy](/vi/docs/Web/HTTP/Reference/Headers/Permissions-Policy) (ví dụ: [`camera`](/vi/docs/Web/HTTP/Reference/Headers/Permissions-Policy/camera) hoặc [`geolocation`](/vi/docs/Web/HTTP/Reference/Headers/Permissions-Policy/geolocation)) **không có sẵn** trong fenced frames.

Các tính năng duy nhất có thể được bật bởi chính sách bên trong fenced frames là các tính năng cụ thể được thiết kế để sử dụng bên trong fenced frames:

- [Protected Audience API](https://privacysandbox.google.com/private-advertising/protected-audience)
  - `attribution-reporting`
  - `private-aggregation`
  - `shared-storage`
  - `shared-storage-select-url`
- [Shared Storage API](/vi/docs/Web/API/Shared_Storage_API)
  - `attribution-reporting`
  - `private-aggregation`
  - `shared-storage`
  - `shared-storage-select-url`

Hiện tại, những tính năng này luôn được bật bên trong fenced frames. Trong tương lai, những tính năng nào được bật sẽ có thể kiểm soát được bằng thuộc tính `allow` của `<fencedframe>`. Việc chặn các tính năng privacy sandbox theo cách này cũng sẽ chặn việc tải fenced frame — không có kênh liên lạc nào cả.

## Di chuyển focus qua ranh giới fenced frame

Khả năng di chuyển focus đang hoạt động của tài liệu qua các ranh giới fenced frame (tức là từ một phần tử bên ngoài fenced frame đến một phần tử bên trong, hoặc ngược lại) bị giới hạn. Các hành động do người dùng khởi tạo như nhấp chuột hoặc nhấn Tab có thể làm điều đó, vì ở đó không có rủi ro lấy dấu vân tay.

Tuy nhiên, việc cố gắng di chuyển qua ranh giới thông qua một lệnh gọi API như {{domxref("HTMLElement.focus()")}} bị cấm — một script độc hại có thể sử dụng một loạt các lệnh gọi như vậy để rò rỉ thông tin được suy ra qua ranh giới.

## Định vị và thu phóng

Là một {{ glossary("replaced elements", "phần tử thay thế")}}, `<fencedframe>` cho phép vị trí của tài liệu nhúng trong hộp của nó được điều chỉnh bằng thuộc tính {{cssxref("object-position")}}.

> [!NOTE]
> Thuộc tính {{cssxref("object-fit")}} không có hiệu lực trên các phần tử `<fencedframe>`.

Kích thước của nội dung nhúng có thể được đặt bởi các thuộc tính `contentWidth` và `contentHeight` bên trong của đối tượng {{domxref("HTMLFencedFrameElement.config", "config")}} của `<fencedframe>`. Trong trường hợp đó, việc thay đổi `width` hoặc `height` của `<fencedframe>` sẽ thay đổi kích thước của vùng chứa nhúng trên trang, nhưng tài liệu bên trong vùng chứa sẽ được thu phóng trực quan để phù hợp. Chiều rộng và chiều cao được báo cáo của tài liệu nhúng (tức là {{domxref("Window.innerWidth")}} và {{domxref("Window.innerHeight")}}) sẽ không thay đổi.

## Khả năng tiếp cận

Người dùng điều hướng bằng công nghệ hỗ trợ, chẳng hạn như đọc màn hình, có thể sử dụng thuộc tính [`title`](/vi/docs/Web/HTML/Reference/Global_attributes/title) trên `<fencedframe>` để gán nhãn nội dung của nó. Giá trị của tiêu đề phải mô tả ngắn gọn nội dung nhúng:

```html
<fencedframe
  title="Advertisement for new Log. From Blammo!"
  width="640"
  height="320"></fencedframe>
```

Nếu không có tiêu đề này, người dùng phải điều hướng vào `<fencedframe>` để xác định nội dung nhúng của nó là gì. Sự thay đổi ngữ cảnh này có thể gây nhầm lẫn và tốn thời gian, đặc biệt đối với các trang có nhiều `<fencedframe>` và/hoặc nếu nội dung nhúng chứa nội dung tương tác như video hoặc âm thanh.

## Ví dụ

Để đặt nội dung nào sẽ được hiển thị trong `<fencedframe>`, một API sử dụng (chẳng hạn như [Protected Audience](https://privacysandbox.google.com/private-advertising/protected-audience) hoặc [Shared Storage](https://privacysandbox.google.com/private-advertising/shared-storage)) tạo ra một đối tượng {{domxref("FencedFrameConfig")}}, sau đó được đặt làm giá trị của thuộc tính `config` của `<fencedframe>`.

Ví dụ sau lấy `FencedFrameConfig` từ phiên đấu giá quảng cáo của Protected Audience API, sau đó được sử dụng để hiển thị quảng cáo thắng cuộc trong `<fencedframe>`:

```html
<fencedframe width="640" height="320"></fencedframe>
```

```js
const frameConfig = await navigator.runAdAuction({
  // … auction configuration
  resolveToConfig: true,
});

const frame = document.querySelector("fencedframe");
frame.config = frameConfig;
```

> [!NOTE]
> `resolveToConfig: true` phải được truyền vào lệnh gọi `runAdAuction()` để nhận đối tượng `FencedFrameConfig`. Nếu không được đặt, {{jsxref("Promise")}} kết quả sẽ phân giải thành URN chỉ có thể được sử dụng trong {{htmlelement("iframe")}}.

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/vi/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>
        <a href="/vi/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung luồng</a
        >,
        <a href="/vi/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >, nội dung nhúng, nội dung tương tác, nội dung rõ ràng.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>Không có.</td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Không có, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>Bất kỳ phần tử nào chấp nhận nội dung nhúng.</td>
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
      <td>
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/application_role"><code>application</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/document_role"><code>document</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/img_role"><code>img</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/none_role"><code>none</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role"><code>presentation</code></a>
      </td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLFencedFrameElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Fenced Frame API](/vi/docs/Web/API/Fenced_frame_API)
- [Fenced frames](https://privacysandbox.google.com/private-advertising/fenced-frame) trên privacysandbox.google.com
- [The Privacy Sandbox](https://privacysandbox.google.com/) trên privacysandbox.google.com
