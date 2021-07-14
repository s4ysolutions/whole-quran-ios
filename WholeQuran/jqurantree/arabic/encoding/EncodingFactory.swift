//
//  EncodingFactory.swift
//  WholeQuran
//
//  Created by  Sergey Dolin on 11.07.2021.
//

import Foundation

struct EncodingFactory {
    init() {
    }

    public static func getEncoder(_ encodingType: EncodingType!) -> ArabicEncoder {
        //  Initiate.

        switch encodingType {
        case .Simple:
            return SimpleEncoder()
        case .Unicode:
            return UnicodeEncoder()
        case .Buckwalter:
            return BuckwalterEncoder()
        default:
            // throw JQuranTreeError(error: JQuranTreeErrors.INVALID_ENCODING_TYPE)
            assert(false, JQuranTreeErrors.INVALID_ENCODING_TYPE.rawValue)
        }
        //  Return the encoder.
        // return nil
    }

    public static func getDecoder(_ encodingType: EncodingType!) -> ArabicDecoder {
        //  Create a decoder for the encoding type.
        switch encodingType {
        case .Unicode:
            return UnicodeDecoder()
        case .Buckwalter:
            return BuckwalterDecoder()
        default:
            assert(false, JQuranTreeErrors.INVALID_ENCODING_TYPE.rawValue)
            // throw JQuranTreeError(error: JQuranTreeErrors.INVALID_ENCODING_TYPE)
        }
        //  Return the decoder.
        // return nil
    }
}
