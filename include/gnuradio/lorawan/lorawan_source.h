/* -*- c++ -*- */
/*
 * Copyright 2024 Tapparel Joachim & Laorden Poveda Rubén @TCL, EPFL.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

#ifndef INCLUDED_LORAWAN_LORAWAN_SOURCE_H
#define INCLUDED_LORAWAN_LORAWAN_SOURCE_H

#include <gnuradio/lorawan/api.h>
#include <gnuradio/sync_block.h>

namespace gr {
namespace lorawan {

/*!
 * \brief <+description of block+>
 * \ingroup lorawan
 *
 */
class LORAWAN_API lorawan_source : virtual public gr::sync_block
{
public:
    typedef std::shared_ptr<lorawan_source> sptr;

    /*!
     * \brief Return a shared_ptr to a new instance of lorawan::lorawan_source.
     *
     * To avoid accidental use of raw pointers, lorawan::lorawan_source's
     * constructor is in a private implementation
     * class. lorawan::lorawan_source::make is the public interface for
     * creating new instances.
     */
    static sptr make(int tcp_port);
};

} // namespace lorawan
} // namespace gr

#endif /* INCLUDED_LORAWAN_LORAWAN_SOURCE_H */
