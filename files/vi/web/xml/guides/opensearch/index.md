---
title: OpenSearch description format
slug: Web/XML/Guides/OpenSearch
page-type: guide
sidebar: xmlsidebar
---

**[OpenSearch description format](https://github.com/dewitt/opensearch)** có thể được dùng để mô tả giao diện web của một công cụ tìm kiếm. Điều này cho phép một website tự mô tả một công cụ tìm kiếm cho chính nó, để trình duyệt hoặc ứng dụng client khác có thể dùng công cụ đó. OpenSearch được hỗ trợ bởi (ít nhất) Firefox, Edge, Safari và Chrome. (Xem [Tài liệu tham khảo](#reference_material) để có liên kết tới tài liệu của các trình duyệt khác.)

Firefox cũng hỗ trợ các tính năng bổ sung không có trong tiêu chuẩn OpenSearch, chẳng hạn như gợi ý tìm kiếm. Bài viết này tập trung vào việc tạo các công cụ tìm kiếm tương thích OpenSearch, đồng thời hỗ trợ các tính năng bổ sung này của Firefox.

## Tổng quan

Thanh địa chỉ trong trình duyệt có hai mục đích: bạn có thể nhập một URL để đi thẳng tới một trang, hoặc bạn có thể nhập một thuật ngữ tìm kiếm để truy vấn một công cụ tìm kiếm. Công cụ tìm kiếm sẽ trả về một danh sách kết quả mà bạn có thể duyệt trực tiếp, hoặc bạn có thể mở trang kết quả đầy đủ của công cụ tìm kiếm.

Theo mặc định, trình duyệt có thể kết nối với một vài công cụ tìm kiếm phổ biến, như Google, Bing hoặc Yandex. Giao thức OpenSearch cho phép các website định nghĩa công cụ tìm kiếm riêng của chúng, giúp người dùng tìm kiếm trực tiếp các website đó từ thanh địa chỉ của trình duyệt. Ví dụ, website MDN có một công cụ tìm kiếm toàn trang. Nếu MDN tự đăng ký như một công cụ tìm kiếm, người dùng có thể tìm kiếm MDN trực tiếp từ thanh địa chỉ.

Trình duyệt truy vấn một công cụ tìm kiếm bằng cách yêu cầu một URL. Website định nghĩa một mẫu cho URL sẽ được yêu cầu, và trình duyệt điền các thuật ngữ tìm kiếm của người dùng vào các placeholder được chỉ định. Ví dụ, nếu URL của công cụ tìm kiếm là `https://example.com/search?q={searchTerms}`, thì trình duyệt sẽ yêu cầu `https://example.com/search?q=foo` khi người dùng nhập "foo" vào thanh địa chỉ. Sau đó công cụ tìm kiếm sẽ tạo ra một phản hồi - hoặc là một danh sách kết quả tìm kiếm hoặc một trang kết quả đầy đủ.

Một website định nghĩa công cụ tìm kiếm của nó bằng cách liên kết tới một tệp mô tả XML trong HTML của nó. Khi người dùng lần đầu truy cập website, trình duyệt phát hiện tệp mô tả này và đăng ký công cụ tìm kiếm. Sau đó trình duyệt dùng công cụ tìm kiếm đã đăng ký để xử lý các lượt tìm kiếm từ thanh địa chỉ.

> [!NOTE]
> Chrome đăng ký các công cụ tìm kiếm của site mặc định là "inactive". Người dùng phải kích hoạt thủ công từng site trong phần cài đặt công cụ tìm kiếm.

## Tệp mô tả OpenSearch

Tệp XML mô tả một công cụ tìm kiếm theo mẫu cơ bản dưới đây. Các phần trong _\[dấu ngoặc vuông]_ nên được tùy chỉnh cho công cụ cụ thể của bạn.

```xml
<OpenSearchDescription
  xmlns="http://a9.com/-/spec/opensearch/1.1/"
  xmlns:moz="http://www.mozilla.org/2006/browser/search/">
  <ShortName>[SNK]</ShortName>
  <Description>[Search engine full name and summary]</Description>
  <InputEncoding>[UTF-8]</InputEncoding>
  <Image width="16" height="16" type="image/x-icon">[https://example.com/favicon.ico]</Image>
  <Url type="text/html" template="[searchURL]"/>
  <Url type="application/x-suggestions+json" template="[suggestionURL]"/>
</OpenSearchDescription>
```

- ShortName
  - : Tên ngắn cho công cụ tìm kiếm. Nó phải có **16 ký tự hoặc ít hơn** của văn bản thuần, không có HTML hay markup nào khác.
- Description
  - : Mô tả ngắn gọn về công cụ tìm kiếm. Nó phải có **1024 ký tự hoặc ít hơn** của văn bản thuần, không có HTML hay markup nào khác.
- InputEncoding
  - : [Mã hóa ký tự](/en-US/docs/Glossary/Character_encoding) được dùng khi gửi dữ liệu đầu vào tới công cụ tìm kiếm.
- Image
  - : URL của biểu tượng cho công cụ tìm kiếm. Khi có thể, hãy bao gồm một ảnh 16×16 loại `image/x-icon` (chẳng hạn như `/favicon.ico`) và một ảnh 64×64 loại `image/jpeg` hoặc `image/png`.

    URL cũng có thể dùng lược đồ [`data:` URL](/en-US/docs/Web/URI/Reference/Schemes/data). (Bạn có thể tạo một `data:` URL từ tệp biểu tượng tại [The `data:` URL kitchen](https://software.hixie.ch/utilities/cgi/data/data).)

    ```xml
    <Image height="16" width="16" type="image/x-icon">https://example.com/favicon.ico</Image>
      <!-- or -->
    <Image height="16" width="16">data:image/x-icon;base64,AAABAAEAEBAAA…DAAA=</Image>
    ```

    Firefox lưu vào bộ nhớ đệm biểu tượng dưới dạng `data:` URL [base64](https://en.wikipedia.org/wiki/Base64) (search plug-ins được lưu trong thư mục [profile](https://support.mozilla.org/en-US/kb/profiles-where-firefox-stores-user-data)'s `searchplugins/`). Các URL `http:` và `https:` sẽ được chuyển sang `data:` URL khi điều này xảy ra.

    > [!NOTE]
    > Đối với các biểu tượng được tải từ xa (tức là từ các URL `https://` thay vì `data:` URL), Firefox sẽ từ chối các biểu tượng lớn hơn **10 kilobyte**.

    ![Search suggestions from Google displayed in Firefox's search box](searchsuggestionsample.png)

- Url
  - : Mô tả URL hoặc các URL được dùng cho tìm kiếm. Thuộc tính `template` chỉ định URL cơ sở cho truy vấn tìm kiếm.

    Firefox hỗ trợ ba kiểu URL:
    - `type="text/html"` chỉ định URL cho truy vấn tìm kiếm thực tế.
    - `type="application/x-suggestions+json"` chỉ định URL để lấy gợi ý tìm kiếm. Từ Firefox 63 trở đi, `type="application/json"` được chấp nhận như một bí danh của nó.
    - `type="application/x-moz-keywordsearch"` chỉ định URL được dùng khi một tìm kiếm từ khóa được nhập vào thanh địa chỉ. Kiểu này chỉ được hỗ trợ trong Firefox.

    Với các kiểu URL này, bạn có thể dùng `{searchTerms}` để thay thế các thuật ngữ tìm kiếm mà người dùng nhập vào thanh tìm kiếm hoặc thanh địa chỉ. Các tham số tìm kiếm động khác được hỗ trợ được mô tả trong [OpenSearch 1.1 parameters](https://github.com/dewitt/opensearch/blob/master/opensearch-1-1-draft-6.md#opensearch-11-parameters).

    Với gợi ý tìm kiếm, mẫu URL `application/x-suggestions+json` được dùng để lấy danh sách gợi ý ở định dạng [JSON](/en-US/docs/Glossary/JSON).

## Liên kết tới tệp mô tả OpenSearch

Để hỗ trợ autodiscovery, hãy thêm một phần tử `<link>` cho mỗi công cụ tìm kiếm vào phần `<head>` của trang web của bạn:

```html
<link
  rel="search"
  type="application/opensearchdescription+xml"
  title="[searchTitle]"
  href="[descriptionURL]" />
```

Thay các mục trong _\[dấu ngoặc vuông]_ như giải thích bên dưới:

- `searchTitle`
  - : Tên của tìm kiếm sẽ thực hiện, chẳng hạn như "Search MDC" hoặc "Yahoo! Search". Giá trị này phải khớp với `<ShortName>` trong tệp plugin của bạn.
- `descriptionURL`
  - : URL tới tệp mô tả XML, để trình duyệt có thể tải xuống nó.

Nếu site của bạn cung cấp nhiều công cụ tìm kiếm, bạn có thể hỗ trợ autodiscovery cho tất cả chúng. Ví dụ:

```html
<link
  rel="search"
  type="application/opensearchdescription+xml"
  title="MySite: By Author"
  href="http://example.com/mysiteauthor.xml" />

<link
  rel="search"
  type="application/opensearchdescription+xml"
  title="MySite: By Title"
  href="http://example.com/mysitetitle.xml" />
```

Bằng cách này, site của bạn có thể cung cấp hai công cụ để tìm kiếm: một theo tác giả và một theo tiêu đề.

> [!NOTE]
> Trong Firefox, một thay đổi biểu tượng trong hộp tìm kiếm cho biết có một search plugin được cung cấp. (Xem hình, dấu cộng màu xanh lá.) Vì vậy nếu hộp tìm kiếm không xuất hiện trong giao diện của người dùng, họ sẽ không nhận được bất kỳ dấu hiệu nào. _Nói chung, hành vi khác nhau giữa các trình duyệt_.

## Hỗ trợ cập nhật tự động cho OpenSearch description

Tệp mô tả OpenSearch có thể tự động cập nhật. Để hỗ trợ điều này, hãy bao gồm một phần tử `Url` bổ sung với `type="application/opensearchdescription+xml"` và `rel="self"`. Thuộc tính `template` nên là URL của tài liệu OpenSearch để tự động cập nhật tới.

Ví dụ:

```xml
<Url
  type="application/opensearchdescription+xml"
  rel="self"
  template="https://example.com/mysearchdescription.xml" />
```

## Mẹo khắc phục sự cố

Nếu có lỗi trong tệp mô tả XML của bạn, bạn có thể gặp lỗi khi thêm công cụ tìm kiếm. Nếu thông báo lỗi không hữu ích, hãy dùng các mẹo sau để gỡ rối:

- Kiểm tra rằng máy chủ của bạn phục vụ OpenSearch description với `Content-Type: application/opensearchdescription+xml`.
- Đảm bảo rằng tệp mô tả XML của bạn là well-formed. Bạn có thể kiểm tra bằng cách tải trực tiếp tệp vào trình duyệt. Các dấu ampersand (`&`) trong URL `template` phải được thoát thành `&amp;`, và các thẻ phải được đóng bằng dấu gạch chéo ở cuối hoặc một thẻ đóng tương ứng.
- Đảm bảo bao gồm thuộc tính `xmlns` - nếu thiếu nó, bạn có thể nhận thông báo lỗi như "Firefox could not download the search plugin".
- Bạn **phải** bao gồm một URL `text/html` - các công cụ tìm kiếm chỉ bao gồm Atom hoặc các kiểu URL [RSS](/en-US/docs/Glossary/RSS) (hợp lệ, nhưng Firefox không hỗ trợ) cũng sẽ gây ra lỗi "could not download the search plugin".
- Các favicon được tải từ xa không được lớn hơn 10KB (xem [Firefox bug 361923](https://bugzil.la/361923)).
- Như đã đề cập trước đó, trình duyệt có thể không kích hoạt các phím tắt tìm kiếm của site theo mặc định. Hãy kiểm tra cài đặt của trình duyệt và đảm bảo công cụ tìm kiếm đã được kích hoạt.

Ngoài ra, dịch vụ search plugin còn cung cấp một cơ chế ghi log có thể hữu ích cho các nhà phát triển plugin. Dùng `about:config` để đặt tùy chọn `browser.search.log` thành `true`. Sau đó, thông tin log sẽ xuất hiện trong [Browser Console](https://firefox-source-docs.mozilla.org/devtools-user/browser_console/index.html) của Firefox (Tools ➤ Browser Tools ➤ Browser Console) khi search plugin được thêm vào.

## Tài liệu tham khảo

- [OpenSearch Documentation](https://github.com/dewitt/opensearch)
- [Safari 8.0 Release Notes: Quick Website Search](https://developer.apple.com/library/archive/releasenotes/General/WhatsNewInSafari/Articles/Safari_8_0.html)
- [Microsoft Edge Dev Guide: Search provider discovery](https://learn.microsoft.com/en-us/archive/microsoft-edge/legacy/developer/)
- [The Chromium Projects: Tab to Search](https://www.chromium.org/tab-to-search/)
- imdb.com có một [tệp `osd.xml` hoạt động](https://m.media-amazon.com/images/G/01/imdb/images/imdbsearch-3349468880._CB470047351_.xml)
- [Ready2Search](https://ready.to/search/en/) - tạo OpenSearch plugin. [Customized Search through Ready2Search](https://ready.to/search/make/en_make_plugin.htm)
