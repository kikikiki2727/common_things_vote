module ApplicationHelper
  def default_meta_tags
    {
      site: 'あるあるネタ投票',
      title: 'あるあるネタ投票',
      reverse: true,
      separator: '|',
      description: '自分の好きなあるあるネタに投票しよう！日常で起きたあるあるネタを共有しよう！',
      keywords: '',
      canonical: 'https://aruaruneta.work/',
      noindex: !Rails.env.production?,
      icon: [
        { href: image_url('vote.png') },
        { href: image_url('vote.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/png' }
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: :canonical,
        image: image_url('aruaru.png'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@UDZVsLKlP1jnUTk'
      }
    }
  end
end
