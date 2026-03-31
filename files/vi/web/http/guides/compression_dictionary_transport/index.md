---
title: Compression Dictionary Transport
slug: Web/HTTP/Guides/Compression_dictionary_transport
page-type: guide
status:
  - experimental
browser-compat:
  - html.elements.link.rel.compression-dictionary
  - http.headers.Accept-Encoding.dcb
  - http.headers.Accept-Encoding.dcz
  - http.headers.Available-Dictionary
  - http.headers.Content-Encoding.dcb
  - http.headers.Content-Encoding.dcz
  - http.headers.Dictionary-ID
  - http.headers.Use-As-Dictionary
spec-urls: https://www.rfc-editor.org/rfc/rfc9842
sidebar: http
---

{{SeeCompatTable}}

**Compression Dictionary Transport** là cách sử dụng từ điển nén được chia sẻ để giảm đáng kể kích thước truyền tải của các phản hồi HTTP.

## Tổng quan

Các thuật toán nén được sử dụng trong HTTP để giảm kích thước tài nguyên được tải xuống qua mạng, giảm chi phí băng thông và thời gian tải trang. Các thuật toán nén HTTP không mất dữ liệu hoạt động bằng cách tìm sự dư thừa trong nguồn: ví dụ, những nơi văn bản như chuỗi `"function"` được lặp lại. Chúng sau đó chỉ bao gồm một bản sao của chuỗi dư thừa và thay thế các lần xuất hiện của nó trong tài nguyên bằng các tham chiếu đến bản sao đó. Vì các tham chiếu ngắn hơn chuỗi, phiên bản nén ngắn hơn.

> [!NOTE]
> Một nỗ lực trước đây ở công nghệ này được gọi là SDCH (Shared Dictionary Compression for HTTP) nhưng chưa bao giờ được hỗ trợ rộng rãi và đã bị xóa vào năm 2017. Compression Dictionary Transport là một triển khai được chỉ định tốt hơn và mạnh mẽ hơn với sự đồng thuận rộng hơn của ngành.

Ví dụ: lấy JavaScript này:

```js
function a() {
  console.log("Hello World!");
}

function b() {
  console.log("I am here");
}
```

Điều này có thể được nén bằng cách thay thế các chuỗi lặp lại bằng các tham chiếu đến vị trí trước đó và số ký tự, như thế này:

```plain
function a() {
  console.log("Hello World!");
}

[0:9]b[10:20]I am here[42:46]
```

Trong ví dụ này, `[0:9]` đề cập đến việc sao chép 9 ký tự bắt đầu tại ký tự 0. Lưu ý đây là ví dụ đơn giản hóa để minh họa khái niệm và các thuật toán thực tế phức tạp hơn thế này.

Client sau đó có thể đảo ngược quá trình nén sau khi tải xuống để tái tạo tài nguyên gốc, không nén.

### Từ điển nén

Các thuật toán như {{glossary("Brotli compression")}} và {{glossary("Zstandard compression")}} đạt được hiệu quả cao hơn nữa bằng cách cho phép sử dụng từ điển của các chuỗi thường gặp, vì vậy bạn không cần bất kỳ bản sao nào của chúng trong tài nguyên nén. Các thuật toán này được vận chuyển với từ điển mặc định được xác định trước được sử dụng khi nén các phản hồi HTTP.

Compression Dictionary Transport xây dựng trên điều này bằng cách cho phép bạn cung cấp từ điển riêng của mình đặc biệt áp dụng cho một tập hợp tài nguyên cụ thể. Thuật toán nén sau đó có thể tham chiếu nó như một nguồn byte khi nén và giải nén tài nguyên.

Giả sử các tham chiếu từ ví dụ trước được bao gồm trong từ điển chung đó, điều này có thể được giảm thêm thành:

```plain
[d0:9]a[d10:20]Hello World![d42:46]
[d0:9]b[d10:20]I am here[d42:46]
```

Từ điển có thể là tài nguyên riêng biệt chỉ cần thiết cho Compression Dictionary Transport, hoặc nó có thể là tài nguyên mà trang web cần dù sao.

Ví dụ: giả sử trang web của bạn sử dụng thư viện JavaScript. Bạn thường sẽ tải một phiên bản cụ thể của thư viện và có thể bao gồm tên phiên bản trong tên của thư viện, như `<script src="my-library.v1.js">`. Khi trình duyệt tải trang của bạn, nó sẽ tải một bản sao của thư viện như tài nguyên con.

Nếu sau đó bạn cập nhật lên v2 của thư viện, hầu hết code của thư viện có thể vẫn giữ nguyên. Vì vậy các trang web có thể giảm đáng kể kích thước tải xuống cho `my-library.v2.js` bằng cách cho trình duyệt biết sử dụng `my-library.v1.js` làm từ điển nén cho `my-library.v2.js`. Sau đó tất cả các chuỗi chung giữa v1 và v2 không cần được bao gồm trong tải xuống cho v2, vì trình duyệt đã có chúng. Hầu hết kích thước tải xuống của `my-library.v2.js` sau đó chỉ là phần delta giữa hai phiên bản.

Compression Dictionary Transport có thể đạt được mức nén cao hơn một bậc so với nén sử dụng từ điển được tích hợp mặc định: xem [Compression dictionary transport examples](https://github.com/WICG/compression-dictionary-transport/blob/main/examples.md) để có một số kết quả thực tế.

## Định dạng từ điển

Từ điển nén không tuân theo bất kỳ định dạng cụ thể nào, cũng không có {{Glossary("MIME type")}} cụ thể. Chúng là các tệp thông thường có thể được sử dụng trong việc nén các tệp khác có nội dung tương tự.

Các phiên bản trước của tệp thường có nhiều nội dung tương tự, đó là lý do tại sao chúng tạo ra từ điển tuyệt vời. Sử dụng phiên bản trước của tệp làm từ điển cho phép thuật toán nén tham chiếu hiệu quả tất cả nội dung không thay đổi và chỉ nắm bắt sự khác biệt tương đối nhỏ trong phiên bản mới. Cách tiếp cận này được gọi là delta compression.

Một cách tiếp cận khác là liệt kê các chuỗi phổ biến (ví dụ: các template HTML của bạn) cùng nhau trong tệp `dictionary.txt` mới để nó có thể được sử dụng để nén các trang HTML trên trang web. Bạn có thể tối ưu hóa điều này hơn nữa bằng cách sử dụng công cụ chuyên biệt, ví dụ [Brotli's dictionary generator](https://github.com/google/brotli/blob/master/research/dictionary_generator.cc), giảm từ điển xuống kích thước tối thiểu với sự trùng lặp tối thiểu.

Từ điển cũng có thể được sử dụng để nén hiệu quả các định dạng nhị phân. Ví dụ: các tệp nhị phân [WASM](/en-US/docs/WebAssembly) là các tài nguyên lớn cũng có thể được hưởng lợi từ delta compression.

## Tài nguyên hiện có làm từ điển

Để sử dụng tài nguyên làm từ điển, máy chủ nên bao gồm header {{HTTPHeader("Use-As-Dictionary")}} trong phản hồi cung cấp tài nguyên:

```http
Use-As-Dictionary: match="/js/app.*.js"
```

Giá trị của header này cho biết các tài nguyên có thể sử dụng tài nguyên này làm từ điển: trong trường hợp này, bao gồm bất kỳ tài nguyên nào có URL khớp với [mẫu](/en-US/docs/Web/API/URL_Pattern_API) đã cho.

Khi tài nguyên sau đó được yêu cầu khớp với mẫu đã cho (ví dụ: `app.v2.js`), yêu cầu sẽ bao gồm hash SHA-256 của từ điển khả dụng trong header {{HTTPHeader("Available-Dictionary")}}, cùng với các giá trị `dcb` và/hoặc `dcz` trong header {{HTTPHeader("Accept-Encoding")}} (để delta compression sử dụng Brotli hoặc ZStandard thích hợp):

```http
Accept-Encoding: gzip, br, zstd, dcb, dcz
Available-Dictionary: :pZGm1Av0IEBKARczz7exkNYsZb8LzaMrV7J32a2fFG4=:
```

Máy chủ sau đó có thể phản hồi với phản hồi được mã hóa thích hợp với mã hóa nội dung được chọn trong header {{HTTPHeader("Content-Encoding")}}:

```http
Content-Encoding: dcb
```

Nếu phản hồi có thể cache được, nó phải bao gồm header {{HTTPHeader("Vary")}} để ngăn cache phục vụ tài nguyên nén từ điển cho các client không hỗ trợ chúng hoặc phục vụ phản hồi nén với từ điển sai:

```http
Vary: accept-encoding, available-dictionary
```

Một `id` tùy chọn cũng có thể được cung cấp trong header {{HTTPHeader("Use-As-Dictionary")}}, để cho phép máy chủ tìm tệp từ điển dễ dàng hơn nếu họ không lưu trữ từ điển theo hash:

```http
Use-As-Dictionary: match="/js/app.*.js", id="dictionary-12345"
```

Nếu điều này được cung cấp, giá trị sẽ được gửi trong các yêu cầu tương lai trong header {{HTTPHeader("Dictionary-ID")}}:

```http
Accept-Encoding: gzip, br, zstd, dcb, dcz
Available-Dictionary: :pZGm1Av0IEBKARczz7exkNYsZb8LzaMrV7J32a2fFG4=:
Dictionary-ID: "dictionary-12345"
```

Máy chủ vẫn phải kiểm tra hash từ header `Available-Dictionary` — `Dictionary-ID` là thông tin bổ sung để máy chủ xác định từ điển nhưng không thay thế nhu cầu về header `Available-Dictionary`.

## Từ điển riêng biệt

Tài liệu HTML cũng có thể cung cấp từ điển nén cho trình duyệt không phải là tài nguyên mà trình duyệt đang tải xuống dù sao thông qua phần tử như thẻ {{htmlelement("script")}}. Có hai phương pháp để làm điều này:

- Bao gồm phần tử {{HTMLElement("link")}} có thuộc tính [`rel`](/en-US/docs/Web/HTML/Reference/Attributes/rel) được đặt thành `compression-dictionary`:

  ```html
  <link rel="compression-dictionary" href="/dictionary.dat" />
  ```

- Tham chiếu từ điển bằng cách sử dụng header {{HTTPHeader("Link")}}:

  ```http
  Link: </dictionary.dat>; rel="compression-dictionary"
  ```

Từ điển này sau đó được tải xuống bởi trình duyệt trong thời gian nhàn rỗi và phản hồi đó phải bao gồm header {{HTTPHeader("Use-As-Dictionary")}}:

```http
Use-As-Dictionary: match="/js/app.*.js"
```

Từ đây, quá trình tương tự như ví dụ trước khi tài nguyên khớp được yêu cầu.

## Tạo phản hồi nén từ điển

Phản hồi nén từ điển có thể sử dụng thuật toán Brotli hoặc ZStandard, với hai yêu cầu bổ sung: chúng cũng phải bao gồm magic header và hash từ điển được nhúng.

Tài nguyên nén từ điển có thể được tạo động, nhưng đối với tài nguyên tĩnh, tốt hơn là tạo chúng trước vào thời điểm build. Khi sử dụng các phiên bản trước làm từ điển, điều này sẽ yêu cầu quyết định bao nhiêu phiên bản nén delta cần tạo — chỉ phiên bản cuối cùng, hoặc X phiên bản cuối cùng với một số giá trị X nhất định.

Với tệp từ điển có tên `dictionary.text` và tệp cần nén có tên `data.text`, lệnh Bash sau sẽ nén tệp bằng Brotli, tạo ra tệp nén có tên `data.txt.dcb`:

```bash
echo -en '\xffDCB' > data.txt.dcb && \
openssl dgst -sha256 -binary dictionary.txt >> data.txt.dcb && \
brotli --stdout -D dictionary.txt data.txt >> data.txt.dcb
```

Với cùng các tệp đầu vào, lệnh Bash sau sẽ nén tệp bằng ZStandard, tạo ra tệp nén có tên `data.txt.dcz`:

```bash
echo -en '\x5e\x2a\x4d\x18\x20\x00\x00\x00' > data.txt.dcz && \
openssl dgst -sha256 -binary dictionary.txt >> data.txt.dcz && \
zstd -D dictionary.txt -f -o tmp.zstd data.txt && \
cat tmp.zstd >> data.txt.dcz
```

Lưu ý rằng bạn sẽ cần {{glossary("OpenSSL")}} được cài đặt cục bộ cũng như Brotli hoặc ZStandard.

## Các hạn chế

Các thuật toán nén có nguy cơ bị tấn công bảo mật, vì vậy có một số hạn chế đối với Compression Dictionary Transport, bao gồm:

- Từ điển phải cùng nguồn gốc với tài nguyên sử dụng từ điển.
- Tài nguyên nén từ điển phải cùng nguồn gốc với tài liệu gốc, hoặc tuân theo quy tắc [CORS](/en-US/docs/Web/HTTP/Guides/CORS), và do đó được yêu cầu với thuộc tính [`crossorigin`](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin) và được phục vụ với header {{HTTPHeader("Access-Control-Allow-Origin")}} thích hợp.
- Từ điển bị ràng buộc bởi HTTP Cache partitioning thông thường và do đó không thể được chia sẻ giữa các nguồn gốc ngay cả khi chúng tải xuống cùng tài nguyên. Từ điển sẽ cần được tải xuống lại cho mỗi nguồn gốc.

Ngoài ra, từ điển có thể tự trở thành vector theo dõi nên các trình duyệt có thể hạn chế tính năng này khi cookie bị tắt hoặc khi các biện pháp bảo vệ quyền riêng tư bổ sung khác được bật.

Như với các tài nguyên khác, nếu trang web sử dụng header {{HTTPHeader("Content-Security-Policy")}}, từ điển nén phải là nguồn được phép để có thể được tải. Cụ thể, khi tải [từ điển riêng biệt](#separate_dictionary) bằng [`<link rel="compression-dictionary">`](/en-US/docs/Web/HTML/Reference/Attributes/rel/compression-dictionary), chỉ thị `connect-src` (hoặc `default-src`, nếu `connect-src` không được đặt) phải cho phép vị trí từ điển.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuật ngữ:
  - {{Glossary("Brotli compression")}}
  - {{Glossary("Zstandard compression")}}
- [`<link rel="compression-dictionary">`](/en-US/docs/Web/HTML/Reference/Attributes/rel/compression-dictionary)
- {{HTTPHeader("Accept-encoding")}}
- {{HTTPHeader("Content-encoding")}}
- {{HTTPHeader("Available-Dictionary")}}
- {{HTTPHeader("Dictionary-ID")}}
- {{HTTPHeader("Use-As-Dictionary")}}
- [RFC 9842: Compression Dictionary Transport](https://www.rfc-editor.org/rfc/rfc9842)
- [Resources for Compression Dictionary Transport](https://use-as-dictionary.com/)
