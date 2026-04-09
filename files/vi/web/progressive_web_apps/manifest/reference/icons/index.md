---
title: icons
slug: Web/Progressive_web_apps/Manifest/Reference/icons
page-type: web-manifest-member
browser-compat: manifests.webapp.icons
sidebar: pwasidebar
---

Member manifest `icons` được dùng để chỉ định một hoặc nhiều tệp hình ảnh xác định các biểu tượng đại diện cho ứng dụng web của bạn.

## Cú pháp

```json-nolint
/* Một biểu tượng với thuộc tính tối thiểu bắt buộc */
"icons": [
  {
    "src": "icon/basic-icon.png"
  }
]

/* Một biểu tượng với nhiều mục đích */
"icons": [
  {
    "src": "icon/basic-icon.png",
    "purpose": "monochrome maskable"
  }
]

/* Hai biểu tượng với các thuộc tính khác nhau */
"icons": [
  {
    "src": "icon/low-res.png",
    "sizes": "48x48"
  },
  {
    "src": "maskable_icon.png",
    "sizes": "48x48",
    "type": "image/png"
  }
]
```

### Giá trị

- `icons`
  - : Một mảng các đối tượng.
    Mỗi đối tượng đại diện cho một biểu tượng sẽ được dùng trong một ngữ cảnh cụ thể.
    Ví dụ, bạn có thể thêm biểu tượng để đại diện cho ứng dụng web của mình trên các thiết bị có kích thước màn hình khác nhau, để tích hợp với các hệ điều hành khác nhau, cho màn hình chào, hoặc cho thông báo ứng dụng.

    Mỗi đối tượng biểu tượng có thể có một hoặc nhiều thuộc tính. Trong số đó, chỉ `src` là bắt buộc. Các thuộc tính có thể có gồm:
    - `src`
      - : Một chuỗi chỉ định đường dẫn tới tệp ảnh biểu tượng.
        Nếu `src` là tương đối, đường dẫn sẽ được phân giải tương đối với URL của tệp manifest.
        Ví dụ, URL tương đối `images/icon-192x192.png` cho tệp manifest nằm tại `https://example.com/manifest.json` sẽ được phân giải thành `https://example.com/images/icon-192x192.png`.

    - `sizes` {{Optional_Inline}}
      - : Một chuỗi chỉ định một hoặc nhiều kích thước mà tệp biểu tượng có thể được dùng.
        Mỗi kích thước được chỉ định dưới dạng `<chiều rộng tính bằng pixel>x<chiều cao tính bằng pixel>`.
        Nếu chỉ định nhiều kích thước, chúng được ngăn cách bằng khoảng trắng; ví dụ, `48x48 96x96`.
        Khi có nhiều biểu tượng, trình duyệt có thể chọn biểu tượng phù hợp nhất cho một ngữ cảnh hiển thị cụ thể.
        Với các định dạng raster như PNG, nên chỉ định chính xác các kích thước có sẵn.
        Với các định dạng vector như SVG, bạn có thể dùng `any` để cho biết khả năng co giãn.
        Nếu không chỉ định `sizes`, việc chọn và hiển thị biểu tượng có thể khác nhau tùy theo cách triển khai của trình duyệt.

        Lưu ý rằng định dạng của `sizes` tương tự thuộc tính [`sizes`](/en-US/docs/Web/HTML/Reference/Elements/link#sizes) của phần tử HTML `<link>`.

    - `type` {{Optional_Inline}}
      - : Một chuỗi chỉ định {{Glossary("MIME type")}} của biểu tượng.
        Giá trị nên ở dạng `image/<subtype>`, trong đó `<subtype>` là một định dạng ảnh cụ thể; ví dụ, `image/png` cho biết ảnh PNG.
        Nếu bỏ qua, trình duyệt thường suy ra kiểu ảnh từ phần mở rộng tệp.

    - `purpose` {{Optional_Inline}}
      - : Một chuỗi từ khóa phân biệt chữ hoa chữ thường, chỉ định một hoặc nhiều ngữ cảnh mà biểu tượng có thể được trình duyệt hoặc hệ điều hành dùng.
        Giá trị có thể là một từ khóa duy nhất hoặc nhiều từ khóa phân tách bằng dấu cách.
        Nếu bỏ qua, trình duyệt có thể dùng biểu tượng cho bất kỳ mục đích nào.

        Trình duyệt dùng các giá trị này như gợi ý để xác định biểu tượng được hiển thị ở đâu và như thế nào.
        Ví dụ, biểu tượng `monochrome` có thể được dùng làm huy hiệu hoặc biểu tượng được ghim với dạng tô đặc, khác biệt trực quan so với biểu tượng khởi chạy đầy đủ màu.
        Với nhiều từ khóa, chẳng hạn `monochrome maskable`, trình duyệt có thể dùng biểu tượng cho bất kỳ mục đích nào trong số đó.
        Nếu một mục đích không nhận diện được được đưa vào cùng với các giá trị hợp lệ (ví dụ, `monochrome fizzbuzz`), biểu tượng vẫn có thể được dùng cho các mục đích hợp lệ.
        Tuy nhiên, nếu chỉ chỉ định các mục đích không nhận diện được (ví dụ, `fizzbuzz`), thì nó sẽ bị bỏ qua.

        Các giá trị hợp lệ gồm:
        - `monochrome`
          - : Cho biết biểu tượng được thiết kế để dùng như một biểu tượng đơn sắc với màu tô đặc.
            Với giá trị này, trình duyệt bỏ qua thông tin màu trong biểu tượng và chỉ dùng kênh alpha như một mặt nạ phủ lên bất kỳ màu tô đặc nào.

        - `maskable`
          - : Cho biết biểu tượng được thiết kế với mặt nạ biểu tượng và safe zone trong đầu, sao cho bất kỳ phần nào của ảnh nằm ngoài safe zone đều có thể bị bỏ qua và che đi.

        - `any`
          - : Cho biết biểu tượng có thể được dùng trong bất kỳ ngữ cảnh nào. Đây là giá trị mặc định.

## Mô tả

Biểu tượng giúp nhận diện duy nhất ứng dụng web của bạn trong các ngữ cảnh khác nhau, chẳng hạn trong bộ chuyển tác vụ của hệ điều hành, cài đặt hệ thống, màn hình chính, danh sách ứng dụng, và các nơi khác nơi biểu tượng ứng dụng được hiển thị.

Ngữ cảnh mà một biểu tượng có thể được dùng được xác định bởi trình duyệt và hệ điều hành, dựa trên kích thước và định dạng đã chỉ định.

## Cân nhắc bảo mật

Khả năng của trình duyệt để tải một hình ảnh biểu tượng được điều khiển bởi Content Security Policy ({{Glossary("CSP")}}) của tài liệu sở hữu manifest, cụ thể bởi chỉ thị [`img-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/img-src). Khía cạnh bảo mật này liên quan tới thuộc tính `src`.

Ví dụ, nếu chỉ thị `img-src` trong một header CSP chỉ định `icons.example.com`, thì chỉ các biểu tượng từ domain đó mới có thể được tải. Trong một manifest có hai biểu tượng, một từ `icons.example.com/low-res` và một từ `other.com/hi-res`, chỉ biểu tượng thứ nhất sẽ được tải thành công vì giới hạn CSP.

## Cân nhắc hiệu năng

Chỉ định thuộc tính `type` có thể cải thiện đáng kể hiệu năng vì nó cho phép trình duyệt bỏ qua các hình ảnh có định dạng không được hỗ trợ dễ dàng hơn.
Nếu bạn không chỉ định thuộc tính `type`, trình duyệt có thể cần suy ra định dạng ảnh bằng những cách tốn tài nguyên hơn, chẳng hạn [MIME sniffing](/en-US/docs/Web/HTTP/Guides/MIME_types#mime_sniffing) tệp để tìm chữ ký.

Ít nhất, nếu bạn bỏ qua thuộc tính `type`, hãy dùng phần mở rộng tệp phù hợp và rõ ràng cho ảnh biểu tượng.

## Ví dụ

### Khai báo nhiều biểu tượng

Ví dụ này cho thấy cách khai báo nhiều biểu tượng cho các tình huống và thiết bị khác nhau. Nếu một biểu tượng cho một trường hợp cụ thể không được hỗ trợ hoặc không có sẵn, trình duyệt sẽ quay về các định dạng và kích thước khác có sẵn.

- Hai biểu tượng cùng kích thước (`48x48`) được cung cấp ở các định dạng khác nhau. Biểu tượng đầu tiên được chỉ định rõ là [WebP](/en-US/docs/Web/Media/Guides/Formats/Image_types#webp_image) bằng thuộc tính `type`. Nếu trình duyệt không hỗ trợ WebP, nó sẽ quay về biểu tượng thứ hai cùng kích thước. Với biểu tượng thứ hai, trình duyệt sẽ xác định MIME type từ header HTTP hoặc bằng cách suy ra từ nội dung tệp ảnh. Biểu tượng ở kích thước này thường được dùng cho tab trình duyệt và bookmark.

- Một tệp [ICO](/en-US/docs/Web/Media/Guides/Formats/Image_types#ico_microsoft_windows_icon) được cung cấp với nhiều kích thước từ `72x72` tới `256x256`. Tệp ICO chứa nhiều biểu tượng raster được tối ưu riêng cho các kích thước hiển thị khác nhau. Biểu tượng ở các kích thước này thường được dùng cho phím tắt trên desktop.

- Với các biểu tượng lớn hơn (`257x257` trở lên), một tệp [SVG](/en-US/docs/Web/Media/Guides/Formats/Image_types#svg_scalable_vector_graphics) được chỉ định. Giá trị `sizes` của biểu tượng này được đặt là `any`, cho phép trình duyệt dùng biểu tượng ở bất kỳ kích thước nào. Biểu tượng SVG giữ được chất lượng ở kích thước lớn hơn. Những biểu tượng này rất phù hợp cho màn hình độ phân giải cao như trong [progressive web apps (PWAs)](/en-US/docs/Web/Progressive_web_apps).

```json
{
  "icons": [
    {
      "src": "icon/low-res.webp",
      "sizes": "48x48",
      "type": "image/webp"
    },
    {
      "src": "icon/low-res",
      "sizes": "48x48"
    },
    {
      "src": "icon/hd_hi.ico",
      "sizes": "72x72 96x96 128x128 256x256"
    },
    {
      "src": "icon/hd_hi.svg",
      "sizes": "any"
    }
  ]
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Hướng dẫn loại và định dạng tệp ảnh](/en-US/docs/Web/Media/Guides/Formats/Image_types#webp_image)
- [Biểu tượng đơn sắc và màu tô đặc](https://w3c.github.io/manifest/#monochrome-icons-and-solid-fills)
- [Mặt nạ biểu tượng và safe zone](https://w3c.github.io/manifest/#icon-masks)
