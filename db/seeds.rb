# frozen_string_literal: true

User.find_or_initialize_by(email: 'DonaldGMiller@example.com').update({
                                                                        first_name: 'Donald',
                                                                        last_name: 'Miller',
                                                                        password: 'eeMaev2shai'
                                                                      })

User.find_or_initialize_by(email: 'LawrenceWGrant@example.com').update({
                                                                         first_name: 'Lawrence',
                                                                         last_name: 'Grant',
                                                                         password: 'ahR7iecai'
                                                                       })

User.find_or_initialize_by(email: 'MargeRWilliams@example.com').update({
                                                                         first_name: 'Marge',
                                                                         last_name: 'Williams',
                                                                         password: 'Aechugh1ie'
                                                                       })
