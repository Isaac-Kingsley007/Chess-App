import 'package:chess_app/Chess/piece.dart';
import 'package:chess_app/Chess/piece_type.dart';

class Chess {
  //Initial Chess Board var
  final board = <List<Piece?>>[
    <Piece?>[
      Piece(pieceType: PieceType.rook, isWhite: true),
      Piece(pieceType: PieceType.knight, isWhite: true),
      Piece(pieceType: PieceType.bishop, isWhite: true),
      Piece(pieceType: PieceType.queen, isWhite: true),
      Piece(pieceType: PieceType.king, isWhite: true),
      Piece(pieceType: PieceType.bishop, isWhite: true),
      Piece(pieceType: PieceType.knight, isWhite: true),
      Piece(pieceType: PieceType.rook, isWhite: true),
    ],
    List.filled(8, Piece(pieceType: PieceType.pawn, isWhite: true)),
    List.filled(8, null),
    List.filled(8, null),
    List.filled(8, null),
    List.filled(8, null),
    List.filled(8, Piece(pieceType: PieceType.pawn, isWhite: false)),
    <Piece?>[
      Piece(pieceType: PieceType.rook, isWhite: false),
      Piece(pieceType: PieceType.knight, isWhite: false),
      Piece(pieceType: PieceType.bishop, isWhite: false),
      Piece(pieceType: PieceType.queen, isWhite: false),
      Piece(pieceType: PieceType.king, isWhite: false),
      Piece(pieceType: PieceType.bishop, isWhite: false),
      Piece(pieceType: PieceType.knight, isWhite: false),
      Piece(pieceType: PieceType.rook, isWhite: false),
    ],
  ];

  //king instances
  late final Piece whiteKing = board[0][4]!;
  late final Piece blackKing = board[7][4]!;

  //king Positions
  (int, int) whiteKingPosition = (0, 4);
  (int, int) blackKingPosition = (7, 4);

  bool _isValidPosition(int row, int col) {
    return row >= 0 && row < 8 && col >= 0 && col < 8;
  }

  //function to check wether for the given board the white or black king is at check
  bool isWhiteKingCheck(List<List<Piece?>> board, bool isWhite) {
    //Unpacking kings Position
    var (row, col) = (isWhite) ? whiteKingPosition : blackKingPosition;

    //Checking for a pawn
    bool pawn1 = _isValidPosition(row + 1, col - 1) &&
        board[row + 1][col - 1] != null &&
        board[row + 1][col - 1]!.pieceType == PieceType.pawn &&
        board[row + 1][col - 1]!.isWhite != isWhite;
    bool pawn2 = _isValidPosition(row + 1, col + 1) &&
        board[row + 1][col + 1] != null &&
        board[row + 1][col + 1]!.pieceType == PieceType.pawn &&
        board[row + 1][col + 1]!.isWhite != isWhite;
    if (pawn1 || pawn2) {
      return true;
    }

    //Checking for a check through a king
    //likly not to be happening but usefull when moved
    //if the distance between the opposite king is less than or equal to one then its a check
    var (erow, ecol) = (isWhite) ? blackKingPosition : whiteKingPosition;
    if ((row - erow).abs() <= 1 && (col - ecol).abs() <= 1) return true;

    //checking for linear obtacles

    var directions = <(int, int)>[(1, 0), (-1, 0), (0, 1), (0, -1)];
    int i;

    // loop to check till the end of the board at all the direction
    // Indicated by the Direction List
    for (var (dr, dc) in directions) {
      //loop in the given direction until end of the board or until finding a piece
      for (i = 0;
          _isValidPosition(row + dr * i, col + dc * i) &&
              board[row + dr * i][col + dc * i] == null;
          i++);

      // if actually found a piece ie isValidPostion
      // and its not white
      // and if its a queen or rook return true
      int newRow = row + dr * i, newCol = col + dc * i;
      if (_isValidPosition(newRow, newCol) &&
          board[newRow][newCol]!.isWhite != isWhite &&
          (board[newRow][newCol]!.pieceType == PieceType.queen ||
              board[newRow][newCol]!.pieceType == PieceType.rook)) {
        return true;
      }
    }

    //Checking for Diogonal Obstacles
    //Redifining Directions for diogonal Checking
    directions = <(int, int)>[(1, 1), (-1, -1), (1, -1), (-1, 1)];

    for (var (dr, dc) in directions) {
      //loop in the given direction until end of the board or until finding a piece
      for (i = 0;
          _isValidPosition(row + dr * i, col + dc * i) &&
              board[row + dr * i][col + dc * i] == null;
          i++);

      // if actually found a piece ie isValidPostion
      // and its not white
      // and if its a queen or bishop return true
      int newRow = row + dr * i, newCol = col + dc * i;
      if (_isValidPosition(newRow, newCol) &&
          board[newRow][newCol]!.isWhite != isWhite &&
          (board[newRow][newCol]!.pieceType == PieceType.queen ||
              board[newRow][newCol]!.pieceType == PieceType.bishop)) {
        return true;
      }
    }

    //Checking for Horses ika knights
    //redef directions for knight positions
    directions = <(int, int)>[
      (-1, -2),
      (-1, 2),
      (1, -2),
      (1, 2),
      (2, 1),
      (2, -1),
      (-2, 1),
      (-2, -1)
    ];

    for (var (dr, dc) in directions) {
      if (_isValidPosition(row + dr, col + dc) &&
          board[row + dr][col + dc] != null &&
          board[row + dr][col + dc]!.isWhite != isWhite &&
          board[row + dr][col + dc]!.pieceType == PieceType.knight) return true;
    }

    return false;
  }

  // List<(int, int)> moveBishop((int, int) position, bool isWhite) {
  //   List<(int, int)> moves = [];

  //   var directions = <(int, int)>[(1, 1), (1, -1), (-1, 1), (-1, -1)];

  //   for (var (dr, dc) in directions) {}
  // }
}
